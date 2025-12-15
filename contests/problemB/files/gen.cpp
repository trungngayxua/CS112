#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <iostream>
#include <random>
#include <stdexcept>
#include <string>
#include <unordered_set>
#include <utility>
#include <vector>

using std::cin;
using std::cout;
using std::cerr;
using std::string;
using std::vector;

namespace {

const long long MAX_TOTAL_OUTPUT = 363'636;
const int MAX_ATTEMPTS_PER_TUPLE = 50;
const long long SUBTASK_LIMITS[3] = {0, 191'919, 191'919};

struct Args {
    long long seed = -1;
    bool seed_set = false;
    int n = 10;
    int m = 10;
    int subtask = 2;
    long long time_max = 1'000'000'000'000LL;
    double abort_prob = 0.15;
    double delete_prob = 0.6;
    double creator_commit_bias = 0.8;
    bool randomize_nm = false;
};

Args parse_args(int argc, char* argv[]) {
    Args args;
    for (int i = 1; i < argc; ++i) {
        string arg = argv[i];
        auto require_value = [&](const string& name) -> string {
            if (i + 1 >= argc) {
                throw std::runtime_error("Missing value for " + name);
            }
            return argv[++i];
        };
        if (arg == "--seed") {
            args.seed = std::stoll(require_value(arg));
            args.seed_set = true;
        } else if (arg == "--n") {
            args.n = std::stoi(require_value(arg));
        } else if (arg == "--m") {
            args.m = std::stoi(require_value(arg));
        } else if (arg == "--subtask") {
            args.subtask = std::stoi(require_value(arg));
            if (args.subtask != 1 && args.subtask != 2) {
                throw std::runtime_error("subtask must be 1 or 2");
            }
        } else if (arg == "--time-max") {
            args.time_max = std::stoll(require_value(arg));
        } else if (arg == "--abort-prob") {
            args.abort_prob = std::stod(require_value(arg));
        } else if (arg == "--delete-prob") {
            args.delete_prob = std::stod(require_value(arg));
        } else if (arg == "--creator-commit-bias") {
            args.creator_commit_bias = std::stod(require_value(arg));
        } else if (arg == "--randomize-nm") {
            args.randomize_nm = true;
        } else {
            throw std::runtime_error("Unknown argument: " + arg);
        }
    }
    return args;
}

struct Transactions {
    vector<long long> start;
    vector<long long> commit;
};

std::mt19937_64 make_rng(long long seed, bool seed_set) {
    if (seed_set) {
        return std::mt19937_64(seed);
    }
    std::random_device rd;
    return std::mt19937_64(
        (static_cast<long long>(rd()) << 32) ^ static_cast<long long>(rd()));
}

long long random_in_range(std::mt19937_64& rng, long long lo, long long hi) {
    std::uniform_int_distribution<long long> dist(lo, hi);
    return dist(rng);
}

double random_prob(std::mt19937_64& rng) {
    std::uniform_real_distribution<double> dist(0.0, 1.0);
    return dist(rng);
}

Transactions build_transactions(int n, long long time_max, double abort_prob,
                                std::mt19937_64& rng) {
    if (n < 0) throw std::runtime_error("n must be non-negative");
    Transactions tr;
    tr.start.assign(n, 0);
    tr.commit.assign(n, 0);
    if (n == 0) return tr;

    long long needed = static_cast<long long>(2) * n;
    if (time_max + 1 < needed) {
        throw std::runtime_error("time_max too small for unique timestamps");
    }

    std::unordered_set<long long> used;
    used.reserve(static_cast<size_t>(needed) * 2);
    vector<long long> timeline;
    timeline.reserve(static_cast<size_t>(needed));
    while (static_cast<int>(timeline.size()) < 2 * n) {
        long long val = random_in_range(rng, 0, time_max);
        if (used.insert(val).second) {
            timeline.push_back(val);
        }
    }
    std::sort(timeline.begin(), timeline.end());

    vector<std::pair<long long, long long>> pairs;
    pairs.reserve(n);
    for (int i = 0; i < n; ++i) {
        pairs.emplace_back(timeline[2 * i], timeline[2 * i + 1]);
    }
    std::shuffle(pairs.begin(), pairs.end(), rng);

    for (int i = 0; i < n; ++i) {
        tr.start[i] = pairs[i].first;
        tr.commit[i] = pairs[i].second;
        if (random_prob(rng) < abort_prob) {
            tr.commit[i] = -1;
        }
    }
    return tr;
}

int choose_creator(int n, const vector<int>& committed, double bias,
                   std::mt19937_64& rng) {
    if (n == 0) {
        throw std::runtime_error("Cannot choose creator when n = 0");
    }
    double coin = random_prob(rng);
    if (!committed.empty() && coin < bias) {
        std::uniform_int_distribution<int> dist(0,
                                                static_cast<int>(committed.size()) - 1);
        return committed[dist(rng)];
    }
    std::uniform_int_distribution<int> dist(0, n - 1);
    return dist(rng);
}

int tuple_contribution(int creator_idx, int deleter_idx,
                       const vector<long long>& start_sorted,
                       const vector<long long>& commit_times) {
    if (creator_idx < 0) return 0;
    long long commit_create = commit_times[creator_idx];
    if (commit_create == -1) return 0;
    auto left_it = std::lower_bound(start_sorted.begin(), start_sorted.end(),
                                    commit_create);
    int left = static_cast<int>(left_it - start_sorted.begin());
    int right = static_cast<int>(start_sorted.size());
    if (deleter_idx >= 0) {
        long long commit_delete = commit_times[deleter_idx];
        if (commit_delete != -1) {
            auto right_it = std::lower_bound(start_sorted.begin(),
                                             start_sorted.end(),
                                             commit_delete);
            right = static_cast<int>(right_it - start_sorted.begin());
            if (right < left) right = left;
        }
    }
    return std::max(0, right - left);
}

int pick_deleter(int creator_idx, const vector<int>& ordered_committed,
                 const vector<int>& commit_rank,
                 const vector<long long>& commit_times, double delete_prob,
                 std::mt19937_64& rng) {
    long long commit_create = commit_times[creator_idx];
    if (commit_create == -1) return -1;
    if (ordered_committed.empty() || random_prob(rng) > delete_prob) return -1;
    int pos = commit_rank[creator_idx];
    if (pos == -1 || pos >= static_cast<int>(ordered_committed.size()) - 1) {
        return -1;
    }
    std::uniform_int_distribution<int> dist(pos + 1,
                                            static_cast<int>(ordered_committed.size()) - 1);
    return ordered_committed[dist(rng)];
}

std::pair<vector<int>, vector<int>> generate_tuples(
    int m, const vector<long long>& start_times,
    const vector<long long>& commit_times, double delete_prob,
    double creator_bias, std::mt19937_64& rng) {
    int n = static_cast<int>(start_times.size());
    if (m < 0) throw std::runtime_error("m must be non-negative");
    if (n == 0 && m > 0) {
        throw std::runtime_error("Cannot create tuples without transactions");
    }

    vector<long long> start_sorted = start_times;
    std::sort(start_sorted.begin(), start_sorted.end());

    vector<int> committed;
    for (int i = 0; i < n; ++i) {
        if (commit_times[i] != -1) committed.push_back(i);
    }
    vector<int> ordered_committed = committed;
    std::sort(ordered_committed.begin(), ordered_committed.end(),
              [&](int lhs, int rhs) {
                  return commit_times[lhs] < commit_times[rhs];
              });
    vector<int> commit_rank(n, -1);
    for (int i = 0; i < static_cast<int>(ordered_committed.size()); ++i) {
        commit_rank[ordered_committed[i]] = i;
    }

    int safe_creator = -1;
    for (int i = 0; i < n; ++i) {
        if (commit_times[i] == -1) {
            safe_creator = i;
            break;
        }
    }
    if (safe_creator == -1 && !ordered_committed.empty()) {
        safe_creator = ordered_committed.back();
    }

    vector<int> create_tx(m, 0), delete_tx(m, -1);
    long long total_contrib = 0;

    for (int j = 0; j < m; ++j) {
        bool assigned = false;
        for (int attempt = 0; attempt < MAX_ATTEMPTS_PER_TUPLE; ++attempt) {
            int creator_idx = choose_creator(n, committed, creator_bias, rng);
            int deleter_idx = pick_deleter(creator_idx, ordered_committed,
                                           commit_rank, commit_times,
                                           delete_prob, rng);
            int contrib = tuple_contribution(creator_idx, deleter_idx,
                                             start_sorted, commit_times);
            if (total_contrib + contrib <= MAX_TOTAL_OUTPUT) {
                create_tx[j] = creator_idx + 1;
                delete_tx[j] = (deleter_idx == -1) ? -1 : deleter_idx + 1;
                total_contrib += contrib;
                assigned = true;
                break;
            }
        }

        if (!assigned) {
            if (safe_creator == -1) {
                throw std::runtime_error(
                    "Cannot enforce output limit with given parameters");
            }
            create_tx[j] = safe_creator + 1;
            delete_tx[j] = -1;
        }
    }

    if (total_contrib > MAX_TOTAL_OUTPUT) {
        throw std::runtime_error("Total output limit exceeded");
    }
    return {create_tx, delete_tx};
}

}  // namespace

int main(int argc, char* argv[]) {
    try {
        std::ios::sync_with_stdio(false);
        cin.tie(nullptr);

        Args args = parse_args(argc, argv);
        long long limit = SUBTASK_LIMITS[args.subtask];
        if (args.n < 0 || args.m < 0) {
            throw std::runtime_error("n and m must be non-negative");
        }
        if (args.n > limit || args.m > limit) {
            throw std::runtime_error("Requested n or m exceed subtask limit");
        }

        auto rng = make_rng(args.seed, args.seed_set);

        int n = args.n;
        int m = args.m;
        if (args.randomize_nm) {
            std::uniform_int_distribution<int> dist_n(1, static_cast<int>(limit));
            std::uniform_int_distribution<int> dist_m(0, static_cast<int>(limit));
            n = dist_n(rng);
            m = dist_m(rng);
        }

        Transactions tr =
            build_transactions(n, args.time_max, args.abort_prob, rng);
        auto tuples = generate_tuples(m, tr.start, tr.commit, args.delete_prob,
                                      args.creator_commit_bias, rng);

        cout << n << ' ' << m << '\n';
        for (int i = 0; i < n; ++i) {
            cout << tr.start[i] << ' ' << tr.commit[i] << '\n';
        }
        for (int j = 0; j < m; ++j) {
            cout << tuples.first[j] << ' ' << tuples.second[j] << '\n';
        }
        return 0;
    } catch (const std::exception& ex) {
        cerr << "Generator error: " << ex.what() << '\n';
        return 1;
    }
}
