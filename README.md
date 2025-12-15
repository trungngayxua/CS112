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
- **Problem A – Fucs và gánh nặng mưu sinh:** Iterated Greedy kết hợp Simulated Annealing, phá/hàn lời giải theo deadline và chọn tác vụ dựa trên tỉ lệ `p/r` để xử lý Subtask 1–2.
- **Problem B – Version Control Timeline:** Event sweeping trên trục thời gian với `std::set` lưu các transaction đang mở, truy vấn trạng thái ngay tại thời điểm commit.
- **Problem C – Balanced Pasture:** Nén toạ độ và Fenwick Tree đôi để đếm số điểm từng phía, kết hợp binary lifting trên prefix BIT nhằm tìm đường cắt cân bằng.

## Cấu trúc kho mã
```
.
├── contests/          # Bộ đề luyện contest, test scripts, checker và lời giải
├── problems/          # Bản gốc đề bài cho từng problem (LaTeX, example, tutorial…)
├── reports/           # Báo cáo solution của từng nhóm
├── slides/            # Slide thuyết trình cho buổi báo cáo cuối kỳ
└── README.md          # Hướng dẫn tổng quan repo
```

## Quy ước thư mục chính
- `contests/` chứa từng bài theo cấu trúc Polygon (files/tests/solutions/scripts). Khi làm bài mới sao chép thư mục template, cập nhật `statement`, thêm test và viết code trong `check.cpp`.
- `problems/` đồng bộ trực tiếp các file đề gốc từ `contests/<problem>/statements`. Mỗi thư mục con (`problemA/`, `problemB/`, `problemC/`, …) gồm `problem.tex`, `example.01`, `tutorial.tex` (nếu có) để tiện trích dẫn/biên dịch độc lập.
- `reports/` là nơi các nhóm/upload solution report của mình (ví dụ `reports/group-1/problemA.md`). 
- `slides/` chứa file trình chiếu chính thức (`Practice Algorithm Design #3.pdf`). Nếu có phiên bản khác, đặt tên phân theo ngày cập nhật.
