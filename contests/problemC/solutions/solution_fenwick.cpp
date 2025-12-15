#include <bits/stdc++.h>
using namespace std;

struct Fenwick {
  int n;
  vector<int> bit;
  void init(int n_) {
    n = n_;
    bit.assign(n + 1, 0);
  }
  void add(int idx, int val) {
    for (; idx <= n; idx += idx & -idx) bit[idx] += val;
  }
  int prefix(int idx) const {
    if (idx <= 0) return 0;
    if (idx > n) idx = n;
    int res = 0;
    for (; idx > 0; idx -= idx & -idx) res += bit[idx];
    return res;
  }
};

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  long long H, W;
  cin >> H >> W;

  int N;
  if (!(cin >> N)) return 0;

  // tọa độ dùng long long để chịu được tới 1e12
  vector<pair<long long, long long>> cows(N);
  vector<long long> xs;
  xs.reserve(N);

  for (int i = 0; i < N; ++i) {
    cin >> cows[i].first >> cows[i].second; // x, y ≤ 1e12
    xs.push_back(cows[i].first);
  }

  // nén tọa độ x
  sort(xs.begin(), xs.end());
  xs.erase(unique(xs.begin(), xs.end()), xs.end());
  for (auto &c : cows) {
    c.first = lower_bound(xs.begin(), xs.end(), c.first) - xs.begin() + 1; // trong [1..M]
  }

  // sort theo y rồi x; dùng đúng kiểu long long
  sort(cows.begin(), cows.end(),
       [](const pair<long long, long long> &a,
          const pair<long long, long long> &b) {
         if (a.second != b.second) return a.second < b.second;
         return a.first < b.first;
       });

  int M = (int)xs.size();
  Fenwick north, south;
  north.init(M);
  south.init(M);

  // Fenwick chỉ đếm số lượng -> ép về int index
  for (auto &c : cows) north.add((int)c.first, 1);

  int northTotal = N, southTotal = 0;

  auto calc = [&](int pos) {
    int westNorth = north.prefix(pos);
    int westSouth = south.prefix(pos);
    int eastNorth = northTotal - westNorth;
    int eastSouth = southTotal - westSouth;
    return max(max(westNorth, westSouth), max(eastNorth, eastSouth));
  };

  int maxLog = 0;
  while ((1 << (maxLog + 1)) <= M) ++maxLog;

  auto query = [&]() {
    int pos = 0;
    int upperLeft = 0, lowerLeft = 0;
    for (int bitIdx = maxLog; bitIdx >= 0; --bitIdx) {
      int step = 1 << bitIdx;
      if (pos + step > M) continue;
      int npos = pos + step;
      int nextUpper = upperLeft + north.bit[npos];
      int nextLower = lowerLeft + south.bit[npos];
      if (max(nextUpper, nextLower) <=
          max(southTotal - nextLower, northTotal - nextUpper)) {
        upperLeft = nextUpper;
        lowerLeft = nextLower;
        pos = npos;
      }
    }
    int best = calc(pos);
    if (pos + 1 <= M) best = min(best, calc(pos + 1));
    return best;
  };

  int ans = N;
  for (int i = 0; i < N;) {
    int j = i;
    while (j < N && cows[j].second == cows[i].second) {
      int xi = (int)cows[j].first;
      north.add(xi, -1);
      south.add(xi, 1);
      --northTotal;
      ++southTotal;
      ++j;
    }
    ans = min(ans, query());
    i = j;
  }

  cout << ans << '\n';
}