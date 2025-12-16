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
- **Problem B – Truy Vấn Du Hành Thời Gian Trên CSDL:** Event sweeping trên trục thời gian với `std::set` lưu các transaction đang mở, truy vấn trạng thái ngay tại thời điểm commit.
- **Problem C – Phân vùng bộ nhớ hệ điều hành:** Nén toạ độ và Fenwick Tree đôi để đếm số điểm từng phía, kết hợp binary lifting trên prefix BIT nhằm tìm đường cắt cân bằng.

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
- `contests/`: mỗi bài toán là một thư mục hoàn chỉnh gồm `statements/` (đề xuất bản Polygon), `tests/` (bộ test chính thức + checker), `solutions/` (code Python hiện tại) và `files/` (generator, validator). Nếu cần viết script build/test thì đặt trong `scripts/` hoặc `check.cpp` ngay tại thư mục bài.
- `problems/`: bản sao thu gọn của đề gốc dùng cho việc đọc nhanh/biên dịch LaTeX. Một problem chứa `problem.tex`, file ví dụ (`example.xx`), và các phụ lục như `tutorial.tex` nếu có.
- `reports/`: báo cáo phân tích của từng nhóm, lưu dạng Markdown; đặt tên theo `reports/<group>/problemX.md` kèm kết quả benchmark hoặc ghi chú tối ưu.
- `slides/`: tài liệu thuyết trình chính thức và các bản nháp cập nhật theo mốc thời gian; ưu tiên file PDF để tiện chia sẻ trước buổi bảo vệ.
