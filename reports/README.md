# Reports Folder

Thư mục `reports/` là nơi tập hợp các báo cáo solution của từng nhóm. Mỗi nhóm có thể tạo thư mục riêng (ví dụ `group-01`, `group-02`) và trong đó viết báo cáo cho từng bài (`problemA.md`, `problemB.md`, …). Nguồn chính là Markdown (`.md`) để tiện review version; nếu cần PDF, export và đặt cạnh file `.md`.

## Tổ chức khuyến nghị
```
reports/
├── group-01/
│   ├── problemA.md
│   └── problemB.md
├── group-02/
│   └── problemC.md
└── summary.md
```
- `group-xx/`: thư mục con cho mỗi nhóm, đặt tên theo số nhóm hoặc tên thành viên.
- Báo cáo dùng chung định dạng để dễ so sánh giữa các nhóm.
- Nếu có báo cáo tổng kết chung của lớp, đặt ở gốc thư mục (`summary.md`).

## Đề xuất đặt tên
- `group-<id>/problem<letter>.md`: báo cáo cho từng nhóm/từng bài.
- `week-<n>.md`: tổng kết theo tuần (nếu cần ghi chú tiến độ chung).
- `summary.md`: báo cáo cuối kỳ tổng hợp.

## Nội dung báo cáo tối thiểu
1. **Mô tả bài toán**: yêu cầu, ràng buộc, input/output (tham chiếu `problems/<problem>/problem.tex` khi cần).
2. **Phân tích**:
   - Mô hình hoá, nhận xét đặc trưng, các hướng tiếp cận đã thử.
   - Độ phức tạp mong đợi và lý do lựa chọn thuật toán cuối cùng.
3. **Thuật toán/giải pháp**:
   - Pseudocode hoặc flow mô tả rõ ràng.
   - Phân tích chứng minh tính đúng (đối với Greedy/DP cần giải thích bất biến).
4. **Độ phức tạp**: nêu rõ O(...) theo input.
5. **Kiểm thử**:
   - Bảng test tiêu biểu (test id, mô tả, kết quả).
   - Bất kỳ corner case nào phát hiện được.
6. **Đánh giá & mở rộng**: những cải tiến có thể làm, ghi chú bug hoặc câu hỏi mở.

## Template Markdown gợi ý
```markdown
# Group <id> – Problem <letter>
## 1. Mô tả vấn đề
...
## 2. Phân tích & ý tưởng
...
## 3. Thuật toán / Pseudocode
...
## 4. Độ phức tạp
...
## 5. Kiểm thử
| Test | Mục đích | Kết quả |
|------|----------|---------|
| test01 | Case n nhỏ | Passed |
## 6. Nhận xét / So sánh nhóm khác
...
```

## Quy ước commit
- Khi hoàn tất báo cáo cho một contest hoặc một nhóm, commit kèm nhánh code/lời giải liên quan để việc truy xuất dễ dàng.
- Nếu thêm hình ảnh/biểu đồ, đặt chúng trong `reports/assets/` (tạo thư mục mới nếu chưa có) và dùng đường dẫn tương đối trong Markdown.
- Tránh lưu file nhị phân lớn không cần thiết, chỉ giữ PDF cuối cùng nếu bắt buộc phải nộp.
