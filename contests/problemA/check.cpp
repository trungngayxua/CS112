#include "testlib.h"
#include <vector>
#include <cmath>
#include <algorithm>

using namespace std;

// K càng lớn thì điểm rớt càng nhanh.
// K = 5.0: Vừa phải. K = 30.0: Rất gắt.
const double EXPONENT_K = 3.6;

struct Task {
    int id;
    long long r, t, p;
};

int main(int argc, char* argv[]) {
    registerTestlibCmd(argc, argv);

    // 1. ĐỌC INPUT
    int n = inf.readInt();
    vector<Task> tasks(n + 1);
    for (int i = 1; i <= n; i++) {
        tasks[i].id = i;
        tasks[i].r = inf.readLong();
        tasks[i].t = inf.readLong();
        tasks[i].p = inf.readLong();
    }

    // 2. ĐỌC OUTPUT
    // Đọc đáp án của Jury trước để lấy benchmark
    long long jury_profit = ans.readLong(); 
    
    // Đọc output thí sinh
    long long cont_profit_declared = ouf.readLong();
    vector<int> schedule;
    // Đọc đến hết file hoặc hết dòng tùy format đề bài
    // Dùng seekEof() an toàn hơn cho các định dạng lỏng lẻo
    while (!ouf.seekEof()) {
        schedule.push_back(ouf.readInt());
    }

    // 3. VALIDATION (Kiểm tra tính đúng đắn)
    long long curT = 0;
    long long cont_profit_real = 0;
    vector<bool> used(n + 1, false);

    for (int id : schedule) {
        if (id < 1 || id > n)
            quitf(_wa, "Invalid task ID: %d", id);

        if (used[id])
            quitf(_wa, "Duplicate task ID: %d", id);
        used[id] = true;

        curT += tasks[id].r;

        if (curT > tasks[id].t)
            quitf(_wa, "Task %d timed out (finish=%lld, deadline=%lld)", id, curT, tasks[id].t);

        cont_profit_real += tasks[id].p;
    }

    if (cont_profit_real != cont_profit_declared) {
        quitf(_wa, "Declared profit %lld != Real profit %lld", 
              cont_profit_declared, cont_profit_real);
    }

    // 4. SCORING
    // Trường hợp Jury bị lỗi hoặc test case đặc biệt
    if (jury_profit <= 0) {
        // Nếu Jury = 0, thí sinh > 0 thì quá giỏi, còn = 0 thì cũng ok
        if (cont_profit_real > 0)
             quitf(_ok, "Better than Jury (Jury profit <= 0)!");
        else
             quitf(_ok, "Both are 0"); 
    }

    // Tỉ lệ
    long double ratio = (long double)cont_profit_real / (long double)jury_profit;

    // Nếu tốt hơn hoặc bằng Jury -> Full điểm
    if (ratio >= 1.0 - 1e-9) { // Dùng epsilon cho an toàn với số thực
        quitf(_ok, "Perfect! Profit = %lld (Jury = %lld)", cont_profit_real, jury_profit);
    }

    // Tính điểm thành phần
    double score = pow((double)ratio, EXPONENT_K);

    // Clamp score trong khoảng [0, 1]
    if (score < 0.0) score = 0.0;
    if (score > 1.0) score = 1.0;

    // SỬ DỤNG quitp THAY VÌ quitf(_pc...)
    quitp(score, "Profit = %lld (%.2f%% of Jury), Score ratio = %.6f", 
          cont_profit_real, (double)ratio * 100.0, score);
    
    return 0;
}