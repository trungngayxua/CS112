import sys
from bisect import bisect_left
from typing import List, Tuple


class Fenwick:
    def __init__(self, n: int) -> None:
        self.n = n
        self.bit = [0] * (n + 1)

    def add(self, idx: int, val: int) -> None:
        while idx <= self.n:
            self.bit[idx] += val
            idx += idx & -idx

    def prefix(self, idx: int) -> int:
        if idx <= 0:
            return 0
        if idx > self.n:
            idx = self.n
        res = 0
        while idx > 0:
            res += self.bit[idx]
            idx -= idx & -idx
        return res


def main() -> None:
    data = sys.stdin.buffer.read().split()
    if not data:
        return
    it = iter(data)
    _H = int(next(it))
    _W = int(next(it))
    N = int(next(it))

    if N == 0:
        print(0)
        return

    cows: List[List[int]] = []
    xs: List[int] = []
    for _ in range(N):
        x = int(next(it))
        y = int(next(it))
        cows.append([x, y])
        xs.append(x)

    xs.sort()
    unique_xs = []
    prev = None
    for val in xs:
        if val != prev:
            unique_xs.append(val)
            prev = val
    for cow in cows:
        cow[0] = bisect_left(unique_xs, cow[0]) + 1

    cows.sort(key=lambda item: (item[1], item[0]))
    xs_count = len(unique_xs)
    north = Fenwick(xs_count)
    south = Fenwick(xs_count)

    for cow in cows:
        north.add(cow[0], 1)

    north_total = N
    south_total = 0

    def calc(pos: int) -> int:
        west_north = north.prefix(pos)
        west_south = south.prefix(pos)
        east_north = north_total - west_north
        east_south = south_total - west_south
        return max(west_north, west_south, east_north, east_south)

    max_log = 0
    while (1 << (max_log + 1)) <= xs_count:
        max_log += 1

    def query() -> int:
        pos = 0
        upper_left = 0
        lower_left = 0
        for bit_idx in range(max_log, -1, -1):
            step = 1 << bit_idx
            if pos + step > xs_count:
                continue
            npos = pos + step
            next_upper = upper_left + north.bit[npos]
            next_lower = lower_left + south.bit[npos]
            if max(next_upper, next_lower) <= max(south_total - next_lower,
                                                  north_total - next_upper):
                upper_left = next_upper
                lower_left = next_lower
                pos = npos
        best = calc(pos)
        if pos + 1 <= xs_count:
            best = min(best, calc(pos + 1))
        return best

    ans = N
    i = 0
    while i < N:
        j = i
        current_y = cows[i][1]
        while j < N and cows[j][1] == current_y:
            xi = cows[j][0]
            north.add(xi, -1)
            south.add(xi, 1)
            north_total -= 1
            south_total += 1
            j += 1
        ans = min(ans, query())
        i = j

    print(ans)


if __name__ == "__main__":
    main()
