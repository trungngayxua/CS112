#include "testlib.h"

const int MAXN = 500;
const long long MAX_VAL = 1000000000000LL; // 1e12

int main(int argc, char* argv[]) {
    registerValidation(argc, argv);

    // Read N
    int n = inf.readInt(1, MAXN, "n");
    inf.readEoln();

    for (int i = 0; i < n; i++) {
        long long r = inf.readLong(0LL, MAX_VAL, "r");
        inf.readSpace();

        long long t = inf.readLong(0LL, MAX_VAL, "d");
        inf.readSpace();

        long long p = inf.readLong(0LL, MAX_VAL, "p");
        inf.readEoln();

        // Optional logic check
        // ensuref(r <= t, "Line %d: runtime > deadline", i + 2);
    }

    inf.readEof();
    return 0;
}
