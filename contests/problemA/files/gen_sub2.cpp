#include "testlib.h"
#include <bits/stdc++.h>
using namespace std;

const int MAXN = 500;
const long long MAX_VAL = 1000000000000LL; // 1e12
const long long MAX_P = 50000LL;             // <-- giới hạn profit nhỏ lại

// clamp profit vào [0, MAX_P]
long long safeProfit(long long x) {
    if (x < 0) return 0;
    if (x > MAX_P) return MAX_P;
    return x;
}

void printTest(int n, const vector<array<long long,3>>& a) {
    cout << n << "\n";
    for (auto &v : a)
        cout << v[0] << " " << v[1] << " " << v[2] << "\n";
}

/////////////////////////////////////////////////////////////////
// NORMAL
/////////////////////////////////////////////////////////////////
void genNormalCase() {
    int n = MAXN;
    vector<array<long long,3>> a;
    a.reserve(n);

    for (int i = 0; i < n; i++) {
        long long r = rnd.next(1LL, MAX_VAL / 20LL); // <= 5e10
        long long add = 0;
        long long max_add = MAX_VAL - r;
        long long bound = r * 10LL;
        if (bound > max_add) bound = max_add;
        if (bound < 0) bound = 0;
        if (bound == 0) add = 0;
        else add = rnd.next(0LL, bound);
        long long t = r + add;

        // p nhỏ, độc lập: 0..MAX_P
        long long p = rnd.next(0LL, MAX_P);
        p = safeProfit(p);

        a.push_back({r, t, p});
    }
    printTest(n, a);
}

/////////////////////////////////////////////////////////////////
// SPECIAL – correlated p (an toàn, không nhân lớn)
/////////////////////////////////////////////////////////////////
void genSpecialCase() {
    int n = MAXN;
    vector<array<long long,3>> a;
    a.reserve(n);

    for (int i = 0; i < n; i++) {
        long long r = rnd.next(1LL, MAX_VAL / 20LL); // <= 5e10

        // Tạo p correlated với r nhưng không dùng phép nhân lớn:
        // Lấy một giá trị phụ thuộc vào r modulo MAX_P để vẫn có correlation.
        long long base = (r % MAX_P); // 0 .. MAX_P-1
        long long noise = rnd.next(-50LL, 50LL);
        long long p = base + noise;
        // shift và clamp vào [0, MAX_P]
        if (p < 0) p = 0;
        if (p > MAX_P) p = MAX_P;
        p = safeProfit(p);

        long long t = rnd.next(r, MAX_VAL);
        a.push_back({r, t, p});
    }
    printTest(n, a);
}

/////////////////////////////////////////////////////////////////
// EDGE CASE – common deadline
/////////////////////////////////////////////////////////////////
void genEdgeCase() {
    int n = MAXN;
    vector<array<long long,3>> out;
    out.reserve(n);

    vector<long long> r(n);
    long long sum = 0LL;

    for (int i = 0; i < n; i++) {
        // chọn r nhỏ-ish để sum không vượt quá MAX_VAL quá nhiều
        r[i] = rnd.next(1LL, MAX_VAL / (2LL * n)); // safe
        sum += r[i];
    }

    long long common_t = sum / 2LL;
    if (common_t > MAX_VAL) common_t = MAX_VAL;

    for (int i = 0; i < n; i++) {
        long long t = common_t + rnd.next(-1000000LL, 1000000LL);
        if (t < r[i]) t = r[i];
        if (t > MAX_VAL) t = MAX_VAL;

        long long p = rnd.next(0LL, MAX_P);
        p = safeProfit(p);

        out.push_back({r[i], t, p});
    }

    printTest(n, out);
}

/////////////////////////////////////////////////////////////////
// STRESS
/////////////////////////////////////////////////////////////////
void genStressCase() {
    int n = MAXN;
    vector<array<long long,3>> a;
    a.reserve(n);

    for (int i = 0; i < n; i++) {
        int type = rnd.next(1, 3);
        long long r, t, p;

        if (type == 1) {
            // small tasks, relatively tight deadlines, higher profit density
            r = rnd.next(1LL, 1000000LL); // <= 1e6
            t = r + rnd.next(0LL, r);

            // p biased high but capped by MAX_P
            long long bias = rnd.next(200LL, 500LL);
            if (bias > MAX_P) bias = MAX_P;
            p = bias;

        } else if (type == 2) {
            // big r, far deadlines, medium profit
            r = rnd.next(1LL, 1000000000LL); // up to 1e9
            t = MAX_VAL;
            p = rnd.next(50LL, 30000LL);
            p = safeProfit(p);

        } else {
            // random noise
            r = rnd.next(100000LL, MAX_VAL / 100LL);
            t = rnd.next(r, MAX_VAL);
            p = rnd.next(0LL, MAX_P);
        }

        a.push_back({r, t, p});
    }

    printTest(n, a);
}

/////////////////////////////////////////////////////////////////

int main(int argc, char* argv[]) {
    registerGen(argc, argv, 1);

    int type = (argc > 1 ? atoi(argv[1]) : 1);
    if (argc > 2) rnd.setSeed(atoi(argv[2]));

    if (type == 1) genNormalCase();
    else if (type == 2) genSpecialCase();
    else if (type == 3) genEdgeCase();
    else genStressCase();

    return 0;
}
