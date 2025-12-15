#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <random>
#include <stdexcept>
#include <string>
#include <unordered_set>
#include <utility>
#include <vector>

using int64 = long long;

struct Args {
    int64 seed = -1;
    bool seed_set = false;
    int subtask = 3;
    int64 n = 1000;
    int64 h_max = 1'000'000'000'000LL;
    int64 w_max = 1'000'000'000'000LL;
    bool randomize_n = false;
};

const int64 SUBTASK_LIMITS[4] = {0, 9696, 363636, 969696};

Args parse_args(int argc, char* argv[]) {
    Args args;
    for (int i = 1; i < argc; ++i) {
        std::string token = argv[i];
        auto need = [&](const std::string& name) -> std::string {
            if (i + 1 >= argc) {
                throw std::runtime_error("Missing value for " + name);
            }
            return argv[++i];
        };
        if (token == "--seed") {
            args.seed = std::stoll(need(token));
            args.seed_set = true;
        } else if (token == "--subtask") {
            args.subtask = std::stoi(need(token));
            if (args.subtask < 1 || args.subtask > 3) {
                throw std::runtime_error("subtask must be 1, 2, or 3");
            }
        } else if (token == "--n") {
            args.n = std::stoll(need(token));
        } else if (token == "--h-max") {
            args.h_max = std::stoll(need(token));
        } else if (token == "--w-max") {
            args.w_max = std::stoll(need(token));
        } else if (token == "--randomize-n") {
            args.randomize_n = true;
        } else {
            throw std::runtime_error("Unknown argument: " + token);
        }
    }
    return args;
}

int main(int argc, char* argv[]) {
    std::ios::sync_with_stdio(false);
    std::cin.tie(nullptr);

    Args args = parse_args(argc, argv);
    int64 limit = SUBTASK_LIMITS[args.subtask];
    if (args.n < 0) throw std::runtime_error("n must be non-negative");
    if (args.n > limit) {
        throw std::runtime_error("n exceeds subtask limit");
    }
    if (args.h_max < 2 || args.w_max < 2) {
        throw std::runtime_error("h_max and w_max must be at least 2");
    }

    std::mt19937_64 rng;
    if (args.seed_set) {
        rng.seed(args.seed);
    } else {
        rng.seed(std::chrono::steady_clock::now().time_since_epoch().count());
    }

    auto rand_ll = [&](int64 lo, int64 hi) -> int64 {
        std::uniform_int_distribution<int64> dist(lo, hi);
        return dist(rng);
    };

    int64 n = args.n;
    if (args.randomize_n) {
        int64 lower = std::max<int64>(1, limit - std::max<int64>(1, limit / 4));
        std::uniform_int_distribution<int64> dist(lower, limit);
        n = dist(rng);
    }
    if (n == 0) n = 1;

    int64 H_min = std::max<int64>(2, n);
    if (H_min > args.h_max) {
        throw std::runtime_error("h_max is too small to provide n distinct rows");
    }
    int64 W_min = std::max<int64>(2, n);
    if (W_min > args.w_max) {
        throw std::runtime_error("w_max is too small to provide n distinct columns");
    }

    int64 H = rand_ll(H_min, args.h_max);
    int64 W = rand_ll(W_min, args.w_max);

    auto pick_pool_size = [&](int64 total) -> int64 {
        int64 max_pool = std::min(total, n);
        int64 min_pool = std::max<int64>(1, n - std::max<int64>(1, n / 10));
        if (min_pool > max_pool) min_pool = max_pool;
        return rand_ll(min_pool, max_pool);
    };

    int64 row_pool = pick_pool_size(H);
    int64 col_pool = pick_pool_size(W);
    if (row_pool * col_pool < n) {
        while (row_pool * col_pool < n && (row_pool < H || col_pool < W)) {
            if (row_pool < H) ++row_pool;
            if (row_pool * col_pool >= n) break;
            if (col_pool < W) ++col_pool;
        }
        if (row_pool * col_pool < n) {
            throw std::runtime_error("Not enough unique coordinate pairs for n points");
        }
    }

    auto pick_unique = [&](int64 total, int64 count) {
        std::unordered_set<int64> used;
        used.reserve(static_cast<size_t>(count) * 2);
        std::vector<int64> values;
        values.reserve(static_cast<size_t>(count));
        while (static_cast<int64>(values.size()) < count) {
            int64 v = rand_ll(1, total);
            if (used.insert(v).second) values.push_back(v);
        }
        std::sort(values.begin(), values.end());
        return values;
    };

    std::vector<int64> rows = pick_unique(H, row_pool);
    std::vector<int64> cols = pick_unique(W, col_pool);

    std::unordered_set<int64> used_pairs;
    used_pairs.reserve(static_cast<size_t>(n) * 2);
    std::vector<std::pair<int64, int64>> points;
    points.reserve(static_cast<size_t>(n));

    auto encode = [&](int64 ri, int64 ci) -> int64 {
        return ri * (col_pool + 1) + ci;
    };

    while (static_cast<int64>(points.size()) < n) {
        int64 ri = rand_ll(0, row_pool - 1);
        int64 ci = rand_ll(0, col_pool - 1);
        int64 key = encode(ri, ci);
        if (used_pairs.insert(key).second) {
            points.emplace_back(rows[ri], cols[ci]);
        }
    }

    std::shuffle(points.begin(), points.end(), rng);

    std::cout << H << ' ' << W << '\n';
    std::cout << n << '\n';
    for (const auto& [r, c] : points) {
        std::cout << r << ' ' << c << '\n';
    }
    return 0;
}
