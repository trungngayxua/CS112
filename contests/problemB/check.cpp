#include <algorithm>
#include <cctype>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <set>
#include <sstream>
#include <string>
#include <tuple>
#include <vector>

using std::string;
using std::vector;

[[noreturn]] void verdict(bool ok, const string& msg) {
    if (ok) {
        std::cout << "OK: " << msg << '\n';
        std::exit(0);
    }
    std::cout << "Wrong answer: " << msg << '\n';
    std::exit(1);
}

struct InputData {
    int n;
    int m;
    vector<long long> start_time;
    vector<long long> commit_time;
    vector<int> create_tx;
    vector<int> delete_tx;
};

InputData read_input(const string& path) {
    std::ifstream in(path);
    if (!in.is_open()) {
        verdict(false, "Cannot open input file");
    }
    InputData data;
    if (!(in >> data.n >> data.m)) {
        verdict(false, "Failed to read n and m from input");
    }
    data.start_time.assign(data.n + 1, 0);
    data.commit_time.assign(data.n + 1, 0);
    for (int i = 1; i <= data.n; ++i) {
        if (!(in >> data.start_time[i] >> data.commit_time[i])) {
            verdict(false, "Failed to read transaction data");
        }
    }
    data.create_tx.assign(data.m + 1, 0);
    data.delete_tx.assign(data.m + 1, -1);
    for (int j = 1; j <= data.m; ++j) {
        if (!(in >> data.create_tx[j] >> data.delete_tx[j])) {
            verdict(false, "Failed to read tuple data");
        }
    }
    return data;
}

vector<vector<int>> compute_expected(const InputData& data) {
    const int ADD = 0;
    const int QUERY = 1;
    const int DELETE = 2;
    vector<std::tuple<long long, int, int>> events;
    events.reserve(static_cast<size_t>(data.m) * 2 + data.n);

    for (int j = 1; j <= data.m; ++j) {
        int creator = data.create_tx[j];
        if (creator < 1 || creator > data.n) continue;
        long long t_add = data.commit_time[creator];
        if (t_add == -1) continue;
        events.emplace_back(t_add, ADD, j);

        int deleter = data.delete_tx[j];
        if (deleter >= 1 && deleter <= data.n) {
            long long t_del = data.commit_time[deleter];
            if (t_del != -1) {
                events.emplace_back(t_del, DELETE, j);
            }
        }
    }

    for (int t = 1; t <= data.n; ++t) {
        events.emplace_back(data.start_time[t], QUERY, t);
    }

    std::sort(events.begin(), events.end());

    std::set<int> active;
    vector<vector<int>> answers(data.n + 1);
    for (const auto& ev : events) {
        long long time;
        int type, idx;
        std::tie(time, type, idx) = ev;
        (void)time;
        if (type == ADD) {
            active.insert(idx);
        } else if (type == DELETE) {
            active.erase(idx);
        } else {
            answers[idx] = vector<int>(active.begin(), active.end());
        }
    }
    return answers;
}

vector<vector<int>> parse_output(const string& path, int n, int m) {
    std::ifstream in(path);
    if (!in.is_open()) {
        verdict(false, "Cannot open output file: " + path);
    }
    vector<vector<int>> result;
    vector<string> lines;
    string line;
    while (std::getline(in, line)) {
        lines.push_back(line);
    }
    if (n == 0) {
        for (const auto& ln : lines) {
            bool has_non_ws = false;
            for (char c : ln) {
                if (!std::isspace(static_cast<unsigned char>(c))) {
                    has_non_ws = true;
                    break;
                }
            }
            if (has_non_ws) {
                verdict(false, "Expected empty output for n = 0");
            }
        }
        return {};
    }
    if (static_cast<int>(lines.size()) != n) {
        verdict(false, "Expected " + std::to_string(n) + " lines, found " +
                           std::to_string(lines.size()));
    }

    result.reserve(n);
    for (int i = 0; i < n; ++i) {
        const string& ln = lines[i];
        std::istringstream iss(ln);
        int count;
        if (!(iss >> count)) {
            verdict(false, "Line " + std::to_string(i + 1) +
                                ": missing tuple count");
        }
        if (count < 0) {
            verdict(false, "Line " + std::to_string(i + 1) +
                                ": negative tuple count");
        }
        vector<int> tuples;
        tuples.reserve(count);
        for (int j = 0; j < count; ++j) {
            int val;
            if (!(iss >> val)) {
                verdict(false, "Line " + std::to_string(i + 1) +
                                    ": insufficient tuple ids");
            }
            if (val < 1 || val > m) {
                verdict(false, "Line " + std::to_string(i + 1) +
                                    ": tuple id out of range");
            }
            tuples.push_back(val);
        }
        int extra;
        if (iss >> extra) {
            verdict(false, "Line " + std::to_string(i + 1) +
                                ": extra data after tuples");
        }
        for (int j = 1; j < count; ++j) {
            if (tuples[j - 1] >= tuples[j]) {
                verdict(false, "Line " + std::to_string(i + 1) +
                                    ": tuple ids must be strictly increasing");
            }
        }
        result.push_back(std::move(tuples));
    }
    return result;
}

int main(int argc, char* argv[]) {
    if (argc != 4) {
        verdict(false, "Usage: checker <input> <output> <answer>");
    }
    string input_path = argv[1];
    string output_path = argv[2];
    string answer_path = argv[3];

    InputData data = read_input(input_path);
    vector<vector<int>> expected = compute_expected(data);
    vector<vector<int>> jury = parse_output(answer_path, data.n, data.m);
    if (static_cast<int>(jury.size()) != data.n) {
        verdict(false, "Invalid jury answer length");
    }
    for (int i = 0; i < data.n; ++i) {
        if (jury[i] != expected[i + 1]) {
            verdict(false, "Jury answer differs from expected output");
        }
    }

    vector<vector<int>> contestant = parse_output(output_path, data.n, data.m);
    if (static_cast<int>(contestant.size()) != data.n) {
        verdict(false, "Incorrect number of lines in contestant output");
    }
    for (int i = 0; i < data.n; ++i) {
        if (contestant[i] != expected[i + 1]) {
            verdict(false, "Line " + std::to_string(i + 1) + " differs");
        }
    }
    verdict(true, "Accepted");
}
