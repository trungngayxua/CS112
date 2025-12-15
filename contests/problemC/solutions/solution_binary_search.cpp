#include <bits/stdc++.h>
using namespace std;

vector<int> calc_max_height(int max_cows, const vector<pair<int,int>>& cows) {
    const int n = (int)cows.size();
    vector<int> count(n, 0), bound(n, 0);
    int y_bound = n - 1;
    int sum = 0;

    for (int x = 0, i = 0; x < n; ++x) {
        while (i < n && cows[i].first == x) {
            int y = cows[i].second;
            count[y]++;
            if (y <= y_bound) sum++;
            ++i;
        }
        while (sum > max_cows) {
            sum -= count[y_bound];
            --y_bound;
        }
        bound[x] = y_bound;
    }
    return bound;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    long long H, W;
    cin >> H >> W;
    int N;
    if (!(cin >> N)) return 0;

    // FIX TRÀN: x,y phải là long long
    vector<pair<long long,long long>> cows_raw(N);
    for (auto &c : cows_raw) cin >> c.first >> c.second;

    if (N == 0) {
        cout << 0 << '\n';
        return 0;
    }

    // Compress x
    sort(cows_raw.begin(), cows_raw.end());
    int new_x = 0;
    long long actual_x = cows_raw[0].first;
    for (int i = 0; i < N; ++i) {
        if (cows_raw[i].first != actual_x) {
            ++new_x;
            actual_x = cows_raw[i].first;
        }
        cows_raw[i].first = new_x;
    }

    // Compress y
    sort(cows_raw.begin(), cows_raw.end(),
        [&](const pair<long long,long long>& a, const pair<long long,long long>& b) {
            return pair<long long,long long>(a.second, a.first)
                 < pair<long long,long long>(b.second, b.first);
        });

    int new_y = 0;
    long long actual_y = cows_raw[0].second;
    for (int i = 0; i < N; ++i) {
        if (cows_raw[i].second != actual_y) {
            ++new_y;
            actual_y = cows_raw[i].second;
        }
        cows_raw[i].second = new_y;
    }

    // After compression, all coords <= N, safe to cast to int
    vector<pair<int,int>> cows(N);
    for (int i = 0; i < N; ++i)
        cows[i] = { (int)cows_raw[i].first, (int)cows_raw[i].second };

    // restore order sorted by x,y
    sort(cows.begin(), cows.end());

    int low = 1, high = N + 1;

    while (low < high) {
        int mid = (low + high) / 2;
        bool possible = false;

        auto west_south_height = calc_max_height(mid, cows);

        for (auto &c : cows) c.second = N - 1 - c.second;
        auto west_north_height = calc_max_height(mid, cows);

        reverse(cows.begin(), cows.end());
        for (auto &c : cows) {
            c.first = N - 1 - c.first;
            c.second = N - 1 - c.second;
        }
        auto east_south_height = calc_max_height(mid, cows);

        for (auto &c : cows) c.second = N - 1 - c.second;
        auto east_north_height = calc_max_height(mid, cows);

        for (int x = 0; x < N - 1; ++x) {
            int south = min(west_south_height[x], east_south_height[N - 2 - x]) + 1;
            int north = min(west_north_height[x], east_north_height[N - 2 - x]) + 1;
            if (south + north >= N) {
                possible = true;
                break;
            }
        }

        if (possible) high = mid;
        else low = mid + 1;
    }

    cout << low << '\n';
    return 0;
}