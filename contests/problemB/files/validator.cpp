#include <algorithm>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <string>
#include <unordered_set>
#include <vector>

using std::cerr;
using std::cout;
using std::ifstream;
using std::ios;
using std::string;
using std::unordered_set;
using std::vector;

namespace {

constexpr long long MAX_TIME = 1'000'000'000'000LL;
constexpr long long SUBTASK_LIMITS[3] = {0, 9696, 969696};

struct Args {
    int subtask = 2;
    string input_path;
};

[[noreturn]] void fail(const string& message) {
    cerr << "Input is invalid: " << message << '\n';
    std::exit(1);
}

Args parse_args(int argc, char* argv[]) {
    Args args;
    for (int i = 1; i < argc; ++i) {
        string token = argv[i];
        auto require_value = [&](const string& name) -> string {
            if (i + 1 >= argc) fail("Missing value for " + name);
            return argv[++i];
        };
        if (token == "--subtask") {
            args.subtask = std::stoi(require_value(token));
        } else if (token == "--testset") {
            continue;
        } else if (token == "--testOverviewLogFileName") {
            require_value(token);
        } else if (token == "-h" || token == "--help") {
            cout << "Usage: validator [--subtask 1|2] [input]\n";
            std::exit(0);
        } else if (!token.empty() && token[0] == '-') {
            // Ignore unknown options provided by Polygon.
            continue;
        } else if (args.input_path.empty()) {
            args.input_path = token;
        }
    }
    if (args.subtask != 1 && args.subtask != 2) {
        fail("subtask must be 1 or 2");
    }
    return args;
}

std::istream& open_input(const Args& args, ifstream& file) {
    if (!args.input_path.empty()) {
        file.open(args.input_path);
        if (file.is_open()) {
            return file;
        }
    }
    return std::cin;
}

void validate_stream(std::istream& in, int subtask) {
    long long n_ll, m_ll;
    if (!(in >> n_ll >> m_ll)) {
        fail("Unable to read n and m");
    }
    if (n_ll < 0 || m_ll < 0) {
        fail("n and m must be non-negative");
    }
    long long limit = SUBTASK_LIMITS[subtask];
    if (n_ll > limit || m_ll > limit) {
        fail("n or m exceed subtask limit");
    }
    int n = static_cast<int>(n_ll);
    int m = static_cast<int>(m_ll);

    vector<long long> start_time(n);
    vector<long long> commit_time(n);
    unordered_set<long long> used;
    used.reserve(static_cast<size_t>(2) * n + 10);

    for (int i = 0; i < n; ++i) {
        long long start, commit;
        if (!(in >> start >> commit)) {
            fail("Unexpected end of file while reading transactions");
        }
        if (start < 0 || start > MAX_TIME) {
            fail("start_time out of range");
        }
        if (!used.insert(start).second) {
            fail("Duplicate timestamp detected");
        }
        if (commit < -1 || commit > MAX_TIME) {
            fail("commit_time out of range");
        }
        if (commit >= 0) {
            if (!used.insert(commit).second) {
                fail("Duplicate timestamp detected");
            }
            if (commit <= start) {
                fail("commit_time must be greater than start_time");
            }
        }
        start_time[i] = start;
        commit_time[i] = commit;
    }

    for (int j = 0; j < m; ++j) {
        long long creator, deleter;
        if (!(in >> creator >> deleter)) {
            fail("Unexpected end of file while reading tuples");
        }
        if (creator < 1 || creator > n) {
            fail("create_tx index out of range");
        }
        if (deleter != -1 && (deleter < 1 || deleter > n)) {
            fail("delete_tx index out of range");
        }
    }

    long long extra;
    if (in >> extra) {
        fail("Extra data after expected input");
    }
    if (!in.eof() && in.fail()) {
        fail("Input parsing error");
    }
}

}  // namespace

int main(int argc, char* argv[]) {
    Args args = parse_args(argc, argv);
    ifstream file;
    std::istream& input = open_input(args, file);
    validate_stream(input, args.subtask);
    return 0;
}
