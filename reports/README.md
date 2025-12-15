# Reports Folder

Thư mục `reports/` dùng để lưu báo cáo phân tích và đánh giá các bài trong contest. Mỗi báo cáo nên đi kèm source Markdown (`.md`) để tiện chỉnh sửa version, và nếu cần nộp PDF thì export từ cùng file này.

## Đề xuất đặt tên
- `week-<n>.md`: tổng kết theo tuần luyện tập.
- `contest-<problem-id>.md`: tập trung vào từng bài khó.
- `summary.md`: báo cáo cuối kỳ tổng hợp (nếu cần).

## Nội dung báo cáo tối thiểu
1. **Mô tả bài toán**: yêu cầu, ràng buộc, input/output.
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
# Contest <id> – <tên bài>
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
## 6. Nhận xét
...
```

## Quy ước commit
- Khi hoàn tất báo cáo cho một contest, commit kèm nhánh code/lời giải liên quan để việc truy xuất dễ dàng.
- Nếu thêm hình ảnh/biểu đồ, đặt chúng trong `reports/assets/` (tạo thư mục mới nếu chưa có) và dùng đường dẫn tương đối trong Markdown.
- Tránh lưu file nhị phân lớn không cần thiết, chỉ giữ PDF cuối cùng nếu bắt buộc phải nộp.
