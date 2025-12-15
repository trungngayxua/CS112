#include "testlib.h"
#include <bits/stdc++.h>
using namespace std;

const int MAXN = 20;
const int INF = 363636;

struct Task{
    int r, t, p;
};

void printTest(int n, vector<Task> &tasks) {
    cout << n << "\n";
    for (int i=0;i<n;i++) {
        cout << tasks[i].r << " " << tasks[i].t << " " << tasks[i].p << "\n";
    }
}

void genNormalCase() {
    int n = rnd.next(1, 10);
    vector<Task> tasks(n);
    for (int i=0;i<n;i++) {
        tasks[i].r = rnd.next(1, INF/10);
        tasks[i].t = rnd.next(tasks[i].r, INF/10);
        tasks[i].p = rnd.next(1, INF/10);
    }
    printTest(n, tasks);    
}

void genSpecialCase() {
    int n = rnd.next(15, MAXN);
    vector<Task> tasks;
    for (int i = 0; i < n; i++) {
        int r = rnd.next(1000, INF / 2);
        int slack = rnd.next(0, r / 10); 
        int t = r + slack;
        int p = rnd.next(1, INF);
        tasks.push_back({r, t, p});
    }
    printTest(n, tasks);
}

void genEdgeCase() {
    int n = 20; 
    vector<Task> tasks;
    for (int i = 0; i < n; i++) {
        int r = rnd.next(1, INF);
        int t = rnd.next(r, INF); 
        int p = rnd.next(1, INF);
        tasks.push_back({r, t, p});
    }
    printTest(n, tasks);
}


void genStressCase() {
    int n = MAXN; 
    vector<Task> tasks;
    long long total_r = 0;
    
    for (int i = 0; i < n; i++) {

        bool is_big = rnd.next(0, 1); 
        
        int r, t, p;
        if (is_big) {
            r = rnd.next(INF / 2, INF);
            p = rnd.next(INF / 2, INF); 
        } else {
            r = rnd.next(1, 1000);
            p = rnd.next(1, 5000); 
        }
        

        t = rnd.next(r, INF);
        
        tasks.push_back({r, t, p});
    }
    printTest(n, tasks);
}

int main(int argc, char* argv[]) {
    registerGen(argc, argv, 1);
    int type = atoi(argv[1]);
    int seed = atoi(argv[2]);
    rnd.setSeed(seed);
    
    if (type == 1) genNormalCase();
    else if (type == 2) genSpecialCase();
    else if (type == 3) genEdgeCase();
    else genStressCase();
    return 0;
}
