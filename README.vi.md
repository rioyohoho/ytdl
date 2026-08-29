## [ENGLISH INSTRUCTIONS](./README.md)

# YouTube Downloader & Metadata Extractor

Một tiện ích mở rộng Chrome Side Panel gọn nhẹ (Manifest V3) giúp phân tích định dạng, trích xuất siêu dữ liệu (metadata) và tạo lệnh tải xuống `yt-dlp` cũng như file script thực thi hàng loạt (`.bat`) cho video, âm thanh và danh sách phát (playlist) trên YouTube.

---

## ⚡ Tính năng nổi bật

- **Giao diện Side Panel**: Thao tác và quản lý tải xuống trực tiếp ở thanh bên mà không cần chuyển khỏi tab hiện tại.
- **Tải Video & Âm thanh**: Tùy chọn độ phân giải, fps, codec hoặc chuyển đổi trực tiếp sang định dạng MP3.
- **Hỗ trợ Danh sách phát (Playlist)**: Tải, phân trang và tải hàng loạt toàn bộ danh sách phát hoặc các video được chọn.
- **Công cụ chọn phần tử trang**: Nhấn <kbd>Shift</kbd> + <kbd>T</kbd> để nhấp và chọn bất kỳ video nào trực tiếp trên trang YouTube.
- **Xuất siêu dữ liệu (Metadata)**: Xem chi tiết các luồng (stream) và xuất các trường dữ liệu đã chọn sang file `.json` hoặc `.csv`.
- **Tùy biến giao diện & Đa ngôn ngữ**: Hỗ trợ nhiều ngôn ngữ (có tiếng Việt), dễ dàng tùy chỉnh chủ đề và màu sắc.

---

## 📋 Yêu cầu hệ thống

Đảm bảo các công cụ sau đã được cài đặt và thêm vào biến môi trường `PATH` của hệ thống:
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [ffmpeg](https://ffmpeg.org/) (dùng để chuyển đổi định dạng và ghép luồng video/âm thanh)

---

## 🚀 Hướng dẫn cài đặt

1. Clone (hoặc tải về) mã nguồn của repository này.
2. Mở trình duyệt Chrome và truy cập đường dẫn: `chrome://extensions/`.
3. Bật **Chế độ dành cho nhà phát triển (Developer mode)** ở góc trên bên phải.
4. Nhấp vào **Tải tiện ích đã giải nén (Load unpacked)** và chọn thư mục chứa dự án.
5. Nhấp vào biểu tượng tiện ích trên thanh công cụ để mở Side Panel.

*(Tùy chọn cho Linux/macOS)*: Chạy lệnh `chmod +x win_install_yt-dlp.sh && ./win_install_yt-dlp.sh` để cài đặt `yt-dlp`.

---

## 📖 Hướng dẫn sử dụng

### 1. Tải Video hoặc Âm thanh
1. Dán URL/ID video hoặc nhấn <kbd>Shift</kbd> + <kbd>T</kbd> trên trang YouTube để chọn nhanh một video.
2. Chọn độ phân giải mong muốn hoặc tích chọn **Download Audio** (MP3).
3. Đặt đường dẫn thư mục lưu file tải về.
4. Nhấp **Run yt-dlp (.bat)** để chạy tải xuống hoặc **Copy CMD** để sao chép lệnh chạy thủ công qua terminal.

### 2. Tải Danh sách phát (Playlist)
1. Chuyển sang chế độ **Playlist** và nhập URL của playlist.
2. Chọn các video bạn muốn tải về.
3. Nhấp **Run yt-dlp (.bat)** hoặc **Export (.bat)** để xuất file script thực thi hàng loạt.

### 3. Xuất siêu dữ liệu (Metadata)
1. Tải thông tin video để lấy dữ liệu metadata.
2. Tích chọn các trường thông tin mong muốn tại mục **yt-dlp Metadata**.
3. Nhấp vào nút **.json** hoặc **.csv** để xuất file.

---

## 📂 Cấu trúc dự án

```text
├── manifest.json            # Tệp cấu hình Extension (chuẩn Manifest V3)
├── background.js            # Service worker chạy nền (xử lý SidePanel)
├── index.html               # Giao diện chính của Side Panel
├── styles/
│   └── styles.css           # File định dạng giao diện CSS
├── js/
│   ├── config.js            # Cấu hình giao diện mặc định & xử lý Local Storage
│   ├── locales.js           # Trình quản lý đa ngôn ngữ (i18n)
│   ├── ytdlp.js             # Bộ phân tích metadata, client Innertube & tạo lệnh tải
│   ├── side_panel.js        # Xử lý sự kiện DOM và điều khiển Side Panel
│   └── content.js           # Content script hỗ trợ chọn video trực tiếp trên trang
├── languages/
│   ├── en.json              # Bản dịch tiếng Anh
│   └── vi.json              # Bản dịch tiếng Việt
└── win_install_yt-dlp.sh    # Script cài đặt yt-dlp cho hệ thống Unix/Linux
```

---

## ⌨️ Phím tắt

| Phím tắt | Thao tác |
| :--- | :--- |
| <kbd>Shift</kbd> + <kbd>T</kbd> / <kbd>Shift</kbd> + <kbd>R</kbd> | Chọn phần tử video trực tiếp trên trang YouTube |
| <kbd>Enter</kbd> | Tìm kiếm / Lấy thông tin media |

---

## 📄 Giấy phép (License)

Dự án mã nguồn mở phục vụ cho mục đích học tập và nghiên cứu.
