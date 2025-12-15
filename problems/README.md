# Problems Folder

Thư mục `problems/` lưu bản gốc đề bài cho từng problem trong đồ án. Nội dung ở đây được đồng bộ trực tiếp từ `contests/<problem>/statements/vietnamese`, vì vậy bạn có thể xem/chỉnh sửa đề mà không cần mở toàn bộ cấu trúc Polygon.

## Cấu trúc
```
problems/
├── problemA/
│   ├── problem.tex
│   ├── example.01
│   ├── example.01.a
│   └── ...
├── problemB/
│   └── ...
└── problemC/
    └── ...
```
- `problem.tex`: file LaTeX mô tả chính thức.
- `example.xx`, `example.xx.a`, `example.xx.mu`: bộ ví dụ trong đề.
- `tutorial.tex`: xuất hiện ở những bài có phần hướng dẫn/solution chính thức.
- Các file JSON (`problem-properties.json`) giữ metadata như limit, tags.

## Đồng bộ từ contest
1. Sau khi cập nhật đề trong `contests/<problem>/statements`, chạy lệnh:
   ```sh
   cp -R contests/<problem>/statements/vietnamese/. problems/<problem>/
   ```
2. Nếu cần thêm ngôn ngữ khác, tạo thư mục con (`problems/<problem>/english`) và copy tương tự.
3. Không chỉnh sửa trực tiếp file trong `problems/` nếu thay đổi chưa có trong `contests/` để tránh lệch phiên bản.

## Sử dụng
- Các nhóm viết báo cáo có thể trích dẫn hình ảnh, ví dụ từ đây thay vì đi vào thư mục contest phức tạp.
- Khi build PDF cho đề, chạy `pdflatex problem.tex` ngay trong thư mục tương ứng (các asset như `example.*` đã kèm sẵn).
- Thư mục này không chứa code hoặc test, chỉ phục vụ lưu trữ nội dung đề gốc.
