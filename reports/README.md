# Reports Folder

Thư mục `reports/` chứa **các file PDF** do từng nhóm nộp cho bài tập “A – Fucs và gánh nặng mưu sinh”.

## Thông tin bài tập
- Link bài tập: *(đặt link vào đây nếu có)*.
- Deadline: **36h36 – 15/12/2025**.
- Thang điểm:
  - Codeforces: **80%** (chạy test trên hệ thống).
  - Report (PDF): **20%**.

## Yêu cầu báo cáo
- Chỉ cần trình bày **solution cho Subtask 1 và Subtask 2** của bài A.
- Báo cáo phải ở định dạng **PDF** (1 file cho mỗi nhóm).
- Nội dung cần bao gồm:
  1. **Phương pháp thiết kế thuật toán** (0.4 điểm)  
     - Nêu rõ phương pháp (brute force, greedy, DP, heuristic/metaheuristic, …).  
     - Giải thích nguyên lý và cách áp dụng vào subtask.
  2. **Tính phù hợp của phương pháp** (0.4 điểm)  
     - Giải thích vì sao phương pháp hợp lý cho từng subtask.  
     - Nếu Subtask 2 dùng heuristic/metaheuristic: nêu tên thuật toán (VD: Local Search, IG, GA...), lý do chọn, thông số (temperature, mutation rate, iterations, …) và lý do cấu hình.
  3. **Phân tích độ phức tạp** (0.2 điểm)  
     - Đánh giá thời gian & bộ nhớ cho từng subtask.

## Cấu trúc thư mục
```
reports/
├── README.md
├── group-01/        # PDF của nhóm 01 (đặt tên theo nhóm)
│   └── .gitkeep     # Thay bằng <group-01>-problemA-subtasks.pdf
└── group-02/
    └── .gitkeep
```
- Mỗi nhóm tạo **thư mục riêng** `group-<id>/` và đặt 1 file PDF duy nhất bên trong.
- Khi thêm PDF, xoá file `.gitkeep` tương ứng để tránh thừa file.

## Quy tắc nộp báo cáo
1. Đặt tên file: `group-<id>-problemA-subtasks.pdf` (ví dụ `group-01-problemA-subtasks.pdf`).
2. Nếu cần cập nhật, ghi rõ phiên bản trong commit message (VD: `update group-01 report v2`).
3. Không lưu file Markdown/tài liệu phụ trong thư mục nhóm – chỉ PDF cuối cùng.
4. Khi nộp bản PDF mới, đảm bảo code tương ứng trong `contests/problemA` đã được cập nhật để đối chiếu với kết quả Codeforces.

## Checklist trước khi nộp
- [ ] Kiểm tra code đậu 80% điểm trên Codeforces (nếu có subtask online).  
- [ ] Báo cáo mô tả đầy đủ tiêu chí (phương pháp, phù hợp, độ phức tạp).  
- [ ] File PDF đặt đúng thư mục và tên.  
- [ ] Commit/push cả code và PDF trước deadline 36h36 15/12/2025.
