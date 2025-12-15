#include <algorithm>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <set>
#include <sstream>
#include <string>
#include <tuple>
#include <utility>
#include <vector>

using int64 = long long;

struct Point {
    int64 r;
    int col_idx;
};

struct InputData {
    int64 H, W;
    int n;
    std::vector<int64> rows;
    std::vector<int64> cols;
};

[[noreturn]] void verdict(bool ok, const std::string& msg) {
    if (ok) {
        std::cout << "OK: " << msg << '\n';
        std::exit(0);
    }
    std::cout << "Wrong answer: " << msg << '\n';
    std::exit(1);
}

InputData read_input(const std::string& path) {
    std::ifstream in(path);
    if (!in.is_open()) verdict(false, "Cannot open input: " + path);
    InputData data;
    in >> data.H >> data.W;
    long long nll;
    in >> nll;
    data.n = static_cast<int>(nll);
    data.rows.resize(data.n);
    data.cols.resize(data.n);
    for (int i = 0; i < data.n; ++i) {
        in >> data.rows[i] >> data.cols[i];
    }
    return data;
}

struct Fenwick {
    int n;
    std::vector<int64> bit;
    explicit Fenwick(int n) : n(n), bit(n + 1, 0) {}
    void add(int idx, int64 delta) {
        for (; idx <= n; idx += idx & -idx) bit[idx] += delta;
    }
    int64 sum(int idx) const {
        int64 res = 0;
        for (; idx > 0; idx -= idx & -idx) res += bit[idx];
        return res;
    }
};

int64 compute_answer(const InputData& data) {
    if (data.n == 0) return 0;
    if (data.H <= 1 || data.W <= 1) return data.n;

    std::vector<int64> unique_cols = data.cols;
    std::sort(unique_cols.begin(), unique_cols.end());
    unique_cols.erase(std::unique(unique_cols.begin(), unique_cols.end()),
                      unique_cols.end());
    int m = static_cast<int>(unique_cols.size());

    std::vector<Point> pts(data.n);
    std::vector<int64> col_totals(m + 1, 0);
    for (int i = 0; i < data.n; ++i) {
        int idx = static_cast<int>(std::lower_bound(unique_cols.begin(),
                                                    unique_cols.end(),
                                                    data.cols[i]) -
                                   unique_cols.begin()) +
                  1;
        pts[i] = Point{data.rows[i], idx};
        col_totals[idx] += 1;
    }
    std::sort(pts.begin(), pts.end(),
              [](const Point& a, const Point& b) { return a.r < b.r; });

    std::vector<int64> prefix_total(m + 1, 0);
    for (int i = 1; i <= m; ++i) prefix_total[i] = prefix_total[i - 1] + col_totals[i];

    Fenwick top_bit(m);
    int64 processed = 0;
    int64 best = data.n;

    auto evaluate = [&](int64 current_top) -> int64 {
        auto calc = [&](int idx) -> int64 {
            int64 top_prefix = idx ? top_bit.sum(idx) : 0;
            int64 bottom_prefix = prefix_total[idx] - top_prefix;
            int64 top_rest = current_top - top_prefix;
            int64 bottom_rest = (data.n - current_top) - bottom_prefix;
            return std::max(std::max(top_prefix, top_rest),
                            std::max(bottom_prefix, bottom_rest));
        };
        auto left_ge_right = [&](int idx) -> bool {
            int64 top_prefix = idx ? top_bit.sum(idx) : 0;
            int64 bottom_prefix = prefix_total[idx] - top_prefix;
            int64 left = std::max(top_prefix, bottom_prefix);
            int64 right = std::max(current_top - top_prefix,
                                   (data.n - current_top) - bottom_prefix);
            return left >= right;
        };

        int lo = 0, hi = m;
        while (lo < hi) {
            int mid = (lo + hi) / 2;
            if (left_ge_right(mid)) {
                hi = mid;
            } else {
                lo = mid + 1;
            }
        }
        int64 res = calc(lo);
        if (lo > 0) res = std::min(res, calc(lo - 1));
        return res;
    };

    int64 row_min = pts.front().r;
    if (row_min > 1) {
        best = std::min(best, evaluate(0));
    }

    int i = 0;
    while (i < data.n) {
        int j = i;
        int64 row_value = pts[i].r;
        while (j < data.n && pts[j].r == row_value) {
            top_bit.add(pts[j].col_idx, 1);
            ++processed;
            ++j;
        }
        if (row_value < data.H) {
            best = std::min(best, evaluate(processed));
        }
        i = j;
    }
    return best;
}

long long parse_answer(const std::string& path) {
    std::ifstream in(path);
    if (!in.is_open()) verdict(false, "Cannot open output: " + path);
    std::string line;
    std::vector<std::string> lines;
    while (std::getline(in, line)) {
        if (!line.empty() && line.back() == '\r') line.pop_back();
        if (!line.empty()) lines.push_back(line);
    }
    if (lines.size() != 1) {
        verdict(false, "Output must contain exactly one line");
    }
    std::istringstream iss(lines[0]);
    long long ans;
    if (!(iss >> ans)) verdict(false, "Output is not an integer");
    long long extra;
    if (iss >> extra) verdict(false, "Extra data after answer");
    return ans;
}

int main(int argc, char* argv[]) {
    if (argc != 4) {
        verdict(false, "Usage: checker <input> <output> <answer>");
    }
    InputData data = read_input(argv[1]);
    int64 expected = compute_answer(data);
    long long jury = parse_answer(argv[3]);
    if (jury != expected) verdict(false, "Jury answer incorrect");
    long long contestant = parse_answer(argv[2]);
    if (contestant != expected) verdict(false, "Wrong answer");
    verdict(true, "Accepted");
}

