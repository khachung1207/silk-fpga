Đây là template mẫu cho chế độ mặc định :>>
File top của bạn có thể tên là gì cũng được, nhưng module bên trong phải là top_module.
Ở chế độ này bạn dùng được toàn bộ ngoại vi cơ bản, trừ màn hình vga, uart terminal.
Nhớ là có sửa thì sửa logic bên trong thôi nhé, còn các port như top module này thì giữ nguyên nha.
Đứng tại thư mục chứa project.v và các file RTL của bạn chạy lệnh này trong dấu ngoặc kép sau khi cài docker về máy:
"docker run --rm -v "$(pwd):/src" huyatieo/fpga-compiler"