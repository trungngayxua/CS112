#include <algorithm>
#include <iostream>
#include <set>
#include <vector>

using std::cin;
using std::cout;
using std::set;
using std::vector;

struct Event {
    long long time;
    int type;
    int idx;
    bool operator<(const Event& other) const {
        if (time != other.time) return time < other.time;
        if (type != other.type) return type < other.type;
        return idx < other.idx;
    }
};

int main() {
    std::ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int n, m;
    if (!(cin >> n >> m)) {
        return 0;
    }

    vector<long long> start_time(n + 1), commit_time(n + 1);
    for (int i = 1; i <= n; ++i) {
        cin >> start_time[i] >> commit_time[i];
    }

    vector<int> create_tx(m + 1), delete_tx(m + 1);
    for (int j = 1; j <= m; ++j) {
        cin >> create_tx[j] >> delete_tx[j];
    }

    const int ADD = 0;
    const int QUERY = 1;
    const int DELETE = 2;

    vector<Event> events;
    events.reserve(static_cast<size_t>(m) * 2 + n);

    for (int j = 1; j <= m; ++j) {
        int creator = create_tx[j];
        if (creator < 1 || creator > n) continue;
        long long t_add = commit_time[creator];
        if (t_add == -1) continue;
        events.push_back({t_add, ADD, j});

        int deleter = delete_tx[j];
        if (deleter >= 1 && deleter <= n) {
            long long t_del = commit_time[deleter];
            if (t_del != -1) {
                events.push_back({t_del, DELETE, j});
            }
        }
    }

    for (int t = 1; t <= n; ++t) {
        events.push_back({start_time[t], QUERY, t});
    }

    sort(events.begin(), events.end());

    set<int> active;
    vector<vector<int>> answers(n + 1);

    for (const auto& ev : events) {
        if (ev.type == ADD) {
            active.insert(ev.idx);
        } else if (ev.type == DELETE) {
            active.erase(ev.idx);
        } else {
            answers[ev.idx] = vector<int>(active.begin(), active.end());
        }
    }

    for (int t = 1; t <= n; ++t) {
        const auto& tuples = answers[t];
        if (tuples.empty()) {
            cout << 0 << '\n';
        } else {
            cout << tuples.size();
            for (int val : tuples) {
                cout << ' ' << val;
            }
            cout << '\n';
        }
    }

    return 0;
}
