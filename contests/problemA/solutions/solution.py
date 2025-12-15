import math
import random
import sys
import time
from typing import List, Tuple

IG_LOOPS = 10000
DESTRUCTION_RATE = 0.1
SA_START_TEMP = 1_000_000_000_000.0
SA_COOLING = 0.9995


class Task:
    __slots__ = ("id", "r", "t", "p", "ratio")

    def __init__(self, idx: int, r: int, t: int, p: int) -> None:
        self.id = idx
        self.r = r
        self.t = t
        self.p = p
        self.ratio = (p / r) if r else float("inf")


def is_feasible(sol: List[Task]) -> bool:
    current_time = 0
    for task in sol:
        current_time += task.r
        if current_time > task.t:
            return False
    return True


def calc_profit(sol: List[Task]) -> int:
    return sum(task.p for task in sol)


def greedy_initial(tasks: List[Task]) -> List[Task]:
    current_time = 0
    picked: List[Task] = []
    for task in tasks:
        if current_time + task.r <= task.t:
            picked.append(task)
            current_time += task.r
    return picked


def ig_solve(specs: List[Tuple[int, int, int, int]]) -> Tuple[int, List[int]]:
    tasks = [Task(idx, r, t, p) for idx, r, t, p in specs]
    tasks.sort(key=lambda task: task.t)

    rng = random.Random(time.time_ns())
    current_sol = greedy_initial(tasks)
    best_sol = list(current_sol)
    current_profit = calc_profit(current_sol)
    best_profit = current_profit
    temp = SA_START_TEMP

    for _ in range(IG_LOOPS):
        candidate_sol = list(current_sol)
        if candidate_sol:
            remove_cnt = max(1, int(len(candidate_sol) * DESTRUCTION_RATE))
            for _ in range(remove_cnt):
                if not candidate_sol:
                    break
                idx = rng.randint(0, len(candidate_sol) - 1)
                candidate_sol.pop(idx)

        selected_ids = {task.id for task in candidate_sol}
        unselected = [task for task in tasks if task.id not in selected_ids]
        unselected.sort(key=lambda task: task.ratio, reverse=True)

        for task in unselected:
            temp_vec = list(candidate_sol)
            insert_idx = 0
            while insert_idx < len(temp_vec) and temp_vec[insert_idx].t < task.t:
                insert_idx += 1
            temp_vec.insert(insert_idx, task)
            if is_feasible(temp_vec):
                candidate_sol = temp_vec

        candidate_profit = calc_profit(candidate_sol)
        delta = candidate_profit - current_profit
        accept = False

        if delta > 0:
            accept = True
            if candidate_profit > best_profit:
                best_profit = candidate_profit
                best_sol = list(candidate_sol)
        else:
            if temp > 0:
                prob = math.exp(delta / temp)
                if rng.random() < prob:
                    accept = True

        if accept:
            current_sol = candidate_sol
            current_profit = candidate_profit

        temp *= SA_COOLING

    return best_profit, [task.id for task in best_sol]


def bf_solve(specs: List[Tuple[int, int, int, int]]) -> Tuple[int, List[int]]:
    tasks = [Task(idx, r, t, p) for idx, r, t, p in specs]
    tasks.sort(key=lambda task: task.t)
    max_profit = 0
    best_schedule: List[int] = []
    current_schedule: List[int] = []

    def backtrack(idx: int, current_time: int, profit: int) -> None:
        nonlocal max_profit, best_schedule
        if profit > max_profit:
            max_profit = profit
            best_schedule = list(current_schedule)
        if idx == len(tasks):
            return

        task = tasks[idx]
        if current_time + task.r <= task.t:
            current_schedule.append(task.id)
            backtrack(idx + 1, current_time + task.r, profit + task.p)
            current_schedule.pop()
        backtrack(idx + 1, current_time, profit)

    backtrack(0, 0, 0)
    return max_profit, best_schedule


def main() -> None:
    data = sys.stdin.buffer.read().split()
    if not data:
        return
    it = iter(data)
    n = int(next(it))
    specs = []
    for idx in range(1, n + 1):
        r = int(next(it))
        t = int(next(it))
        p = int(next(it))
        specs.append((idx, r, t, p))

    if n <= 20:
        best_profit, schedule = bf_solve(specs)
    else:
        best_profit, schedule = ig_solve(specs)

    solution_line = " ".join(str(x) for x in schedule)
    sys.stdout.write(f"{best_profit}\n{solution_line}\n")


if __name__ == "__main__":
    main()
