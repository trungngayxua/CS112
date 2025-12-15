# Contests Folder

Thư mục `contests/` lưu toàn bộ đề luyện contest cho đồ án. Mỗi bài được tổ chức theo layout giống Polygon nên có thể dùng chung script sinh test, checker và lời giải tham khảo. Hiện có các bài mẫu `problemB/`, `problemC/` dùng làm template.

## Cấu trúc thư mục chuẩn
```
contests/<problem-id>/
├── check.cpp          # Checker/chấm tự động cho bài toán
├── doall.sh|.bat      # Script build + chạy toàn bộ test
├── files/             # Input/output chính thức (nếu có)
├── scripts/           # Script sinh test theo khung Polygon
├── solutions/         # Lời giải mẫu, đáp án chuẩn
├── statements/        # Đề bài dạng PDF/Markdown, tách section
├── tests/             # Bộ test dùng để chấm (testXX.in/out)
└── ...                # Các file Polygon khác (tags, problem.xml,…)
```

## Quy trình làm việc với một bài
1. **Tạo thư mục mới**: sao chép `problemB/` sang tên bài mới, cập nhật `problem.xml` và `statements/`.
2. **Cập nhật đề**: chỉnh `statement-sections` và `statements` để phản ánh version mới.
3. **Viết lời giải**: làm việc trong `solutions/` hoặc đặt code chính trong `check.cpp` tùy theo yêu cầu đề.
4. **Sinh/Kiểm thử test**:
   - Dùng script trong `scripts/` (ví dụ `gen-input-via-stdout.sh`) để sinh test bổ sung.
   - Chạy `./doall.sh` (macOS/Linux) hoặc `doall.bat` (Windows) để build, generate, chạy checker và thống kê kết quả.
   - Bộ test chính nằm trong `tests/`. Đặt tên `test01`, `test02`, … và commit chung với lời giải.
5. **Tự đánh giá**: ghi chú những test quan trọng, độ phức tạp lời giải và kết quả trong báo cáo tương ứng.

## Lưu ý
- Mọi script shell/batch đã cho phép thực thi độc lập. Khi thêm script mới nhớ cấp quyền `chmod +x`.
- Nếu bài cần thư viện phụ (`.h`), đặt chúng trong `files/` hoặc cùng thư mục `solutions/` và cập nhật `doall` để include.
- Commit lời giải và test cùng lúc để đảm bảo có thể tái hiện kết quả chấm về sau.
- Bất cứ thay đổi cấu trúc Polygon nào nên được ghi rõ trong README riêng của bài để tránh nhầm lẫn khi deploy.
