#include <bits/stdc++.h>
using namespace std;

namespace ig{
    // --- THAM SỐ CẤU HÌNH ---
    const int IG_LOOPS = 10000;       // Số vòng lặp (M)
    const double DESTRUCTION_RATE = 0.1; // Tỷ lệ phá hủy (d)
    const double SA_START_TEMP = 1000000000000.0; // Nhiệt độ bắt đầu cho SA
    const double SA_COOLING = 0.9995;     // Tốc độ làm nguội

    struct Task {
        int id;
        long long r, t, p;
        double ratio; // pi / ri
    };

    int n;
    vector<Task> tasks; // Danh sách gốc

    // Bộ sinh số ngẫu nhiên
    mt19937 rng(chrono::steady_clock::now().time_since_epoch().count());
    int randInt(int l, int r) { return uniform_int_distribution<int>(l, r)(rng); }
    double randDouble() { return uniform_real_distribution<double>(0.0, 1.0)(rng); }

    // Hàm kiểm tra tính khả thi O(N)
    // Vì danh sách luôn được giữ thứ tự theo Deadline (EDD)
    bool is_feasible(const vector<Task>& sol) {
        long long current_time = 0;
        for (const auto& task : sol) {
            current_time += task.r;
            if (current_time > task.t) return false;
        }
        return true;
    }

    // Tính tổng lợi nhuận
    long long calc_profit(const vector<Task>& sol) {
        long long p = 0;
        for (const auto& t : sol) p += t.p;
        return p;
    }

    void Solve(int n_input){
        n = n_input;
        tasks.resize(n);
        for (int i = 0; i < n; i++) {
            tasks[i].id = i + 1;
            cin >> tasks[i].r >> tasks[i].t >> tasks[i].p;
            tasks[i].ratio = (double)tasks[i].p / tasks[i].r;
        }

        // 1. Sắp xếp theo Deadline tăng dần (ti)
        sort(tasks.begin(), tasks.end(), [](const Task& a, const Task& b) {
            return a.t < b.t;
        });

        // 2. Khởi tạo danh sách S (Greedy ban đầu)
        vector<Task> current_sol;
        long long current_time = 0;
        for (const auto& t : tasks) {
            if (current_time + t.r <= t.t) {
                current_sol.push_back(t);
                current_time += t.r;
            }
        }

        long long current_profit = calc_profit(current_sol);
        vector<Task> best_sol = current_sol;
        long long best_profit = current_profit;

        double temp = SA_START_TEMP;

        // 3. Vòng lặp chính
        for (int iter = 0; iter < IG_LOOPS; iter++) {
            vector<Task> candidate_sol = current_sol;

            // --- PHA 1: PHÁ HỦY (Destruction) ---
            // Bỏ ngẫu nhiên d = 0.1 các tác vụ
            if (!candidate_sol.empty()) {
                int remove_cnt = max(1, (int)(candidate_sol.size() * DESTRUCTION_RATE));
                for (int k = 0; k < remove_cnt; k++) {
                    if (candidate_sol.empty()) break;
                    int idx = randInt(0, candidate_sol.size() - 1);
                    candidate_sol.erase(candidate_sol.begin() + idx);
                }
            }

            // --- PHA 2: TÁI THIẾT (Construction / Local Search) ---
            // Xác định các tác vụ chưa được chọn (Unselected)
            vector<bool> in_sol(n + 1, false); 
            // Mapping id -> bool, lưu ý: id của task là 1..N
            // Do id lộn xộn sau sort, ta dùng ID gốc để check
            vector<int> sol_ids;
            for(auto& t : candidate_sol) sol_ids.push_back(t.id);
            sort(sol_ids.begin(), sol_ids.end());

            vector<Task> unselected;
            for(auto& t : tasks) {
                if (!binary_search(sol_ids.begin(), sol_ids.end(), t.id)) {
                    unselected.push_back(t);
                }
            }

            // Sắp xếp unselected theo pi/ri giảm dần
            sort(unselected.begin(), unselected.end(), [](const Task& a, const Task& b) {
                return a.ratio > b.ratio;
            });

            // Thử chèn từng tác vụ vào candidate_sol
            for (const auto& u : unselected) {
                // Chèn vào vị trí đúng theo thứ tự deadline (ti)
                vector<Task> temp_vec = candidate_sol;
                
                // Tìm vị trí chèn để đảm bảo tính chất sort theo Deadline
                auto it = lower_bound(temp_vec.begin(), temp_vec.end(), u, [](const Task& a, const Task& b){
                    return a.t < b.t;
                });
                temp_vec.insert(it, u);

                // Check O(N^2) tổng thể (O(N) ở bước này)
                if (is_feasible(temp_vec)) {
                    candidate_sol = temp_vec;
                }
            }

            long long candidate_profit = calc_profit(candidate_sol);

            // --- PHA 3: KIỂM DUYỆT (Acceptance with Simulated Annealing) ---
            long long delta = candidate_profit - current_profit;
            
            bool accept = false;
            if (delta > 0) {
                accept = true; // Luôn lấy nếu tốt hơn
                if (candidate_profit > best_profit) {
                    best_profit = candidate_profit;
                    best_sol = candidate_sol;
                }
            } else {
                // Chấp nhận lùi bước với xác suất e^(delta/T)
                double prob = exp(delta / temp);
                if (randDouble() < prob) {
                    accept = true;
                }
            }

            if (accept) {
                current_sol = candidate_sol;
                current_profit = candidate_profit;
            }

            // Giảm nhiệt độ
            temp *= SA_COOLING;
        }

        // Output
        cout << best_profit << endl;
        for (int i = 0; i < best_sol.size(); i++) {
            cout << best_sol[i].id << (i == best_sol.size() - 1 ? "" : " ");
        }
        cout << endl;
    }
}

namespace bf{

    struct Task {
        int id;
        long long r, t, p;
    };

    int n;
    vector<Task> tasks;
    long long max_profit = 0;
    vector<int> best_schedule;
    vector<int> current_schedule;

    // Hàm quay lui
    void backtrack(int idx, long long current_time, long long current_profit) {
        // Cập nhật kết quả tối ưu
        if (current_profit > max_profit) {
            max_profit = current_profit;
            best_schedule = current_schedule;
        }

        if (idx == n) return;

        if (current_time + tasks[idx].r <= tasks[idx].t) {
            current_schedule.push_back(tasks[idx].id);
            backtrack(idx + 1, current_time + tasks[idx].r, current_profit + tasks[idx].p);
            current_schedule.pop_back(); 
        }

        backtrack(idx + 1, current_time, current_profit);
    }

    void Solve(int n_input){

        n = n_input;
        tasks.resize(n);
        for (int i = 0; i < n; i++) {
            tasks[i].id = i + 1; 
            cin >> tasks[i].r >> tasks[i].t >> tasks[i].p;
        }

        sort(tasks.begin(), tasks.end(), [](const Task& a, const Task& b) {
            return a.t < b.t;
        });

        backtrack(0, 0, 0);

        cout << max_profit << endl;
        for (int i = 0; i < best_schedule.size(); i++) {
            cout << best_schedule[i] << (i == best_schedule.size() - 1 ? "" : " ");
        }
        cout << endl;
    }
}

int main() {
    ios_base::sync_with_stdio(false); cin.tie(NULL);
    if (fopen("input.inp", "r")) {
        freopen("input.inp", "r", stdin);
        freopen("output.out", "w", stdout);
    }

    int n;
    cin >> n;
    if (n <= 20) {
        bf::n = n;
        bf::Solve(n);
    } else {
        ig::n = n;
        ig::Solve(n);
    }

    return 0;
}