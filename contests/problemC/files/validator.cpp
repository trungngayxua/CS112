#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <limits>
#include <string>
#include <unordered_set>
#include <utility>

using int64 = long long;

struct Args {
    int subtask = 3;
    std::string input_path;
};

const int64 SUBTASK_LIMITS[4] = {0, 9696, 363636, 969696};

[[noreturn]] void fail(const std::string& msg) {
    std::cerr << "Input is invalid: " << msg << '\n';
    std::exit(1);
}

Args parse_args(int argc, char* argv[]) {
    Args args;
    for (int i = 1; i < argc; ++i) {
        std::string token = argv[i];
        auto need = [&](const std::string& name) -> std::string {
            if (i + 1 >= argc) fail("Missing value for " + name);
            return argv[++i];
        };
        if (token == "--subtask") {
            args.subtask = std::stoi(need(token));
        } else if (token == "--testset") {
            continue;
        } else if (token == "--testOverviewLogFileName") {
            need(token);
        } else if (token == "-h" || token == "--help") {
            std::cout << "Usage: validator [--subtask X] [input]\n";
            std::exit(0);
        } else if (!token.empty() && token[0] == '-') {
            continue;
        } else if (args.input_path.empty()) {
            args.input_path = token;
        }
    }
    if (args.subtask < 1 || args.subtask > 3) {
        fail("subtask must be 1..3");
    }
    return args;
}

std::istream& open_input(const Args& args, std::ifstream& file) {
    if (!args.input_path.empty()) {
        file.open(args.input_path);
        if (file.is_open()) return file;
    }
    return std::cin;
}

struct PairHash {
    size_t operator()(const std::pair<int64, int64>& p) const noexcept {
        std::uint64_t a =
            static_cast<std::uint64_t>(p.first) ^ (static_cast<std::uint64_t>(p.first) << 21);
        std::uint64_t b =
            static_cast<std::uint64_t>(p.second) ^ (static_cast<std::uint64_t>(p.second) << 1);
        return static_cast<size_t>(a * 11995408973635179863ULL +
                                   b * 10150724397891781847ULL);
    }
};

int main(int argc, char* argv[]) {
    Args args = parse_args(argc, argv);
    std::ifstream file;
    std::istream& in = open_input(args, file);

    int64 H, W;
    if (!(in >> H >> W)) {
        fail("Failed to read H and W");
    }
    if (H < 1 || H > 1'000'000'000'000LL || W < 1 || W > 1'000'000'000'000LL) {
        fail("H or W out of range");
    }
    int64 N;
    if (!(in >> N)) {
        fail("Failed to read N");
    }
    if (N < 0 || N > SUBTASK_LIMITS[args.subtask]) {
        fail("N out of range for subtask");
    }

    std::unordered_set<std::pair<int64, int64>, PairHash> used;
    used.reserve(static_cast<size_t>(N) * 2 + 1);

    for (int64 i = 0; i < N; ++i) {
        int64 r, c;
        if (!(in >> r >> c)) fail("Failed to read coordinate");
        if (r < 1 || r > H || c < 1 || c > W) {
            fail("Coordinate out of range");
        }
        if (!used.emplace(r, c).second) {
            fail("Duplicate coordinate detected");
        }
    }

    int64 extra;
    if (in >> extra) {
        fail("Extra data after expected input");
    }
    return 0;
}
