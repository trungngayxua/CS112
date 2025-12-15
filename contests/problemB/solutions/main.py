import sys
from typing import List, Tuple


def main() -> None:
    data = sys.stdin.buffer.read().split()
    if not data:
        return
    it = iter(data)
    n = int(next(it))
    m = int(next(it))

    start_time = [0] * (n + 1)
    commit_time = [0] * (n + 1)
    for i in range(1, n + 1):
        start_time[i] = int(next(it))
        commit_time[i] = int(next(it))

    create_tx = [0] * (m + 1)
    delete_tx = [0] * (m + 1)
    for j in range(1, m + 1):
        create_tx[j] = int(next(it))
        delete_tx[j] = int(next(it))

    ADD, QUERY, DELETE = 0, 1, 2
    events: List[Tuple[int, int, int]] = []

    for j in range(1, m + 1):
        creator = create_tx[j]
        if 1 <= creator <= n:
            t_add = commit_time[creator]
            if t_add != -1:
                events.append((t_add, ADD, j))
        deleter = delete_tx[j]
        if 1 <= deleter <= n:
            t_del = commit_time[deleter]
            if t_del != -1:
                events.append((t_del, DELETE, j))

    for t in range(1, n + 1):
        events.append((start_time[t], QUERY, t))

    events.sort()
    active: set[int] = set()
    answers: List[List[int]] = [[] for _ in range(n + 1)]

    for _, typ, idx in events:
        if typ == ADD:
            active.add(idx)
        elif typ == DELETE:
            active.discard(idx)
        else:
            answers[idx] = sorted(active)

    out_lines: List[str] = []
    for t in range(1, n + 1):
        tuples = answers[t]
        if not tuples:
            out_lines.append("0")
        else:
            line = f"{len(tuples)} {' '.join(str(val) for val in tuples)}"
            out_lines.append(line)

    sys.stdout.write("\n".join(out_lines) + "\n")


if __name__ == "__main__":
    main()
