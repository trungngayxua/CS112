import sys
from typing import List


def calc_max_height(max_cows: int, cows: List[List[int]]) -> List[int]:
    n = len(cows)
    count = [0] * n
    bound = [0] * n
    y_bound = n - 1
    total = 0
    i = 0
    for x in range(n):
        while i < n and cows[i][0] == x:
            y = cows[i][1]
            count[y] += 1
            if y <= y_bound:
                total += 1
            i += 1
        while total > max_cows:
            total -= count[y_bound]
            y_bound -= 1
        bound[x] = y_bound
    return bound


def main() -> None:
    data = sys.stdin.buffer.read().split()
    if not data:
        return
    it = iter(data)
    _H = int(next(it))
    _W = int(next(it))
    N = int(next(it))
    cows_raw: List[List[int]] = []
    for _ in range(N):
        cows_raw.append([int(next(it)), int(next(it))])

    if N == 0:
        print(0)
        return

    cows_raw.sort()
    current_x = cows_raw[0][0]
    new_x = 0
    for cow in cows_raw:
        if cow[0] != current_x:
            new_x += 1
            current_x = cow[0]
        cow[0] = new_x

    cows_raw.sort(key=lambda pair: (pair[1], pair[0]))
    current_y = cows_raw[0][1]
    new_y = 0
    for cow in cows_raw:
        if cow[1] != current_y:
            new_y += 1
            current_y = cow[1]
        cow[1] = new_y

    cows = [[int(cow[0]), int(cow[1])] for cow in cows_raw]
    cows.sort()

    low, high = 1, N + 1
    while low < high:
        mid = (low + high) // 2
        possible = False

        west_south_height = calc_max_height(mid, cows)

        for cow in cows:
            cow[1] = N - 1 - cow[1]
        west_north_height = calc_max_height(mid, cows)

        cows.reverse()
        for cow in cows:
            cow[0] = N - 1 - cow[0]
            cow[1] = N - 1 - cow[1]
        east_south_height = calc_max_height(mid, cows)

        for cow in cows:
            cow[1] = N - 1 - cow[1]
        east_north_height = calc_max_height(mid, cows)

        for x in range(0, N - 1):
            south = min(west_south_height[x], east_south_height[N - 2 - x]) + 1
            north = min(west_north_height[x], east_north_height[N - 2 - x]) + 1
            if south + north >= N:
                possible = True
                break

        if possible:
            high = mid
        else:
            low = mid + 1

    print(low)


if __name__ == "__main__":
    main()
