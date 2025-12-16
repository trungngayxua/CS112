# Report Feedback Summary

Tổng hợp điểm rubric cho báo cáo bài **A – Fucs và gánh nặng mưu sinh**. Mỗi nhóm được chấm theo 3 tiêu chí (0,4 – Phương pháp, 0,4 – Tính phù hợp, 0,2 – Độ phức tạp). Chi tiết đầy đủ được giữ trong `report_feedback.txt`.

## Rubric chi tiết

| Codeforce | Tiêu chí 1 | Tiêu chí 2 | Tiêu chí 3 | Điểm tổng | Nhận xét |
|-----------|------------|------------|------------|-----------|----------|
| group1    | 0,40       | 0,40       | 0,20       | 1,00      | Brute Force + Beam Search (Pareto, beam 15k) mô tả rõ từng subtask và phân tích O(N!·N)/O(N·B log B); đủ rubric. |
| group2    | 0,40       | 0,40       | 0,20       | 1,00      | DP theo cặp (R,P) + Pareto áp dụng cho cả hai subtask, phân tích O(N^2) thời gian/bộ nhớ; đạt tối đa. |
| group3    | 0,40       | 0,40       | 0,20       | 1,00      | DFS exact + Randomized Greedy Repair liên hệ từng subtask và ghi rõ O(2^n) + O(n log n); trọn vẹn. |
| group4    | 0,40       | 0,40       | 0,20       | 1,00      | Branch & Bound + Transfer-and-Conquer + ALNS có pipeline, tham số và phân tích subtask chi tiết; đủ rubric. |
| group5    | 0,40       | 0,40       | 0,20       | 1,00      | Backtracking/Branch-and-Bound + Beam Search nêu lý do chọn và phân tích O(2^n), O(N·W log W); đáp ứng. |
| group8    | 0,32       | 0,30       | 0,18       | 0,80      | Subtask 1 chỉ sinh tập con rồi EDD, thiếu chứng minh brute force; Beam Search không nêu beam width/pruning hay gắn scoring nên rubric chưa đủ. |
| group9    | 0,38       | 0,38       | 0,20       | 0,96      | Có Backtracking + Beam Search nhưng thiếu mô tả lưu trạng thái/bộ nhớ cho subtask lớn nên chưa trọn rubric. |
| group10   | 0,32       | 0,30       | 0,18       | 0,80      | “Brute force” cố định thứ tự theo deadline, không xét hoán vị/lưu trạng thái; Beam Search thiếu beam width/dominance và chỉ ghi O(N·K) nên chưa đạt rubric. |
| group11   | 0,28       | 0,27       | 0,20       | 0,75      | Chỉ nêu Beam Search chung, thiếu thuật toán exact cho Subtask 1 và không tách độ phức tạp; cần bổ sung. |
| group16   | 0,40       | 0,40       | 0,20       | 1,00      | Bitmask brute force + IG/SA mô tả quy trình, thông số, phân tích O(2^n·n log n)/O(K·N); đạt tối đa. |
