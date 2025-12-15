# CS112 – Analysis and Design of Algorithms

## Trường Đại học Công nghệ Thông tin - ĐHQG TP.HCM

## Thông tin nhóm
| Họ tên | MSSV |
|------|------|
| Lê Quang Trung | 24521883 |
| Nguyễn Hồng Phúc | 24521390 |

## Luyện tập phân tích và thiết kế thuật toán #3
### Mục tiêu đồ án
Đồ án tập trung vào quá trình phân tích – thiết kế – hiện thực thuật toán thông qua các contest mô phỏng kỳ thi. Mỗi bài toán đều được:
- Phân tích ràng buộc, mô hình hoá và chọn kỹ thuật thuật toán phù hợp.
- Cài đặt, kiểm thử tự động bằng bộ test đi kèm trong thư mục `contests`.
- Viết báo cáo nêu rõ ý tưởng, chứng minh tính đúng và đánh giá độ phức tạp.

### Kiến thức áp dụng
- Greedy
- Dynamic Programming
- Graph Algorithms
- Phân tích độ phức tạp và chứng minh tính đúng của thuật toán

## Cấu trúc kho mã
```
.
├── contests/          # Bộ đề luyện contest, test scripts, checker và lời giải
├── problems/          # Bản gốc đề bài cho từng problem (LaTeX, example, tutorial…)
├── reports/           # Báo cáo solution của từng nhóm và theo từng bài
├── slides/            # Slide thuyết trình cho buổi báo cáo cuối kỳ
└── README.md          # Hướng dẫn tổng quan repo
```

## Quy ước thư mục chính
- `contests/` chứa từng bài theo cấu trúc Polygon (files/tests/solutions/scripts). Khi làm bài mới sao chép thư mục template, cập nhật `statement`, thêm test và viết code trong `check.cpp`.
- `problems/` đồng bộ trực tiếp các file đề gốc từ `contests/<problem>/statements`. Mỗi thư mục con (`problemA/`, `problemB/`, `problemC/`, …) gồm `problem.tex`, `example.01`, `tutorial.tex` (nếu có) để tiện trích dẫn/biên dịch độc lập.
- `reports/` là nơi các nhóm/upload solution report của mình (ví dụ `reports/group-1/problemA.md`). Markdown là format chính, bản PDF nếu cần có thể export từ đó và lưu cùng thư mục.
- `slides/` chứa file trình chiếu chính thức (`Practice Algorithm Design #3.pdf`). Nếu có phiên bản khác, đặt tên phân theo ngày cập nhật.

## Quy trình làm việc đề xuất
1. **Phân tích bài**: đọc đề trong `problems/` hoặc `contests/<problem>/statements`.
2. **Thiết kế & cài đặt**: viết code trong `contests/<problem>/solutions` hoặc `check.cpp`, chạy `scripts/doall.sh` (Linux/macOS) hoặc `doall.bat` để build & test.
3. **Kiểm thử**: sử dụng bộ test trong `tests/`, bổ sung test tự tạo vào thư mục tương ứng để tránh regressions.
4. **Báo cáo**: ghi lại ý tưởng, giả mã, phân tích độ phức tạp và kết quả benchmark vào `reports/<contest>.md`.
5. **Chuẩn bị thuyết trình**: cập nhật `slides/` sau mỗi milestone để phản ánh tiến độ mới nhất.

## Liên hệ & ghi chú
- Mọi thay đổi lớn (thêm contest, cập nhật báo cáo) nên ghi lại trong commit message rõ ràng.
- Nếu bổ sung thư viện ngoài chuẩn C++, thêm hướng dẫn build tương ứng trong README của contest đó.
- Thư mục `contests/problemB` đã được cấu hình đầy đủ (scripts, tests). Có thể dùng làm template cho các contest mới bằng cách sao chép thư mục và đổi tên.
