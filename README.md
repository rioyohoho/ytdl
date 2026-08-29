## [HƯỚNG DẪN TIẾNG VIỆT](./README.vi.md)

# YouTube Downloader & Metadata Extractor

A browser extension for quickly downloading videos/audio via `yt-dlp` and `command`.

---

## ⚡ Features

- **Side Panel Interface**: Access download controls without leaving your current tab.
- **Video & Audio Downloads**: Select resolutions, fps, and codecs, or convert directly to MP3.
- **Playlist Support**: Load, paginate, and batch download full playlists or selected items.
- **Page Element Picker**: Press <kbd>Shift</kbd> + <kbd>T</kbd> to click and pick any video on YouTube.
- **Metadata Export**: Inspect complete stream details and export selected fields to `.json` or `.csv`.
- **Customizable UI & i18n**: Multi-language support with theme and color configuration.

---

## 📋 Requirements

Ensure the following tools are installed and added to your system `PATH`:
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [ffmpeg](https://ffmpeg.org/) (for format conversion and stream merging)

---

## 🚀 Installation

1. Clone or download this repository.
2. Open Chrome and navigate to `chrome://extensions/`.
3. Enable **Developer mode** (top-right).
4. Click **Load unpacked** and select the project folder.
5. Click the extension icon to open the Side Panel.

*(Optional for Linux/macOS)*: Run `chmod +x win_install_yt-dlp.sh && ./win_install_yt-dlp.sh` to install `yt-dlp`.

---

## 📖 Usage

### 1. Download Video or Audio
1. Paste a video URL/ID or press <kbd>Shift</kbd> + <kbd>T</kbd> on a YouTube page to pick a video.
2. Select resolution or check **Download Audio** (MP3).
3. Set your target download path.
4. Click **Run yt-dlp (.bat)** to execute or **Copy CMD** for manual execution.

### 2. Download Playlists
1. Switch to **Playlist** mode and enter the playlist URL.
2. Select the items you want to download.
3. Click **Run yt-dlp (.bat)** or **Export (.bat)** to generate the batch script.

### 3. Export Metadata
1. Load a video to fetch its metadata.
2. Select desired fields under **yt-dlp Metadata**.
3. Click **.json** or **.csv** to export.

---

## 📂 Project Structure

```text
├── manifest.json            # Extension manifest (MV3 configuration)
├── background.js            # Background service worker (SidePanel handler)
├── index.html               # Main UI for the Side Panel
├── styles/
│   └── styles.css           # UI stylesheet
├── js/
│   ├── config.js            # Default styling configuration & local storage logic
│   ├── locales.js           # Multi-language translation manager
│   ├── ytdlp.js             # Core metadata parser, Innertube client & command builder
│   ├── side_panel.js        # DOM event handling and Side Panel controller
│   └── content.js           # Content script for element picking on YouTube
├── languages/
│   ├── en.json              # English localization
│   └── vi.json              # Vietnamese localization
└── win_install_yt-dlp.sh    # yt-dlp binary installer script for Unix-like systems
```


## ⌨️ Shortcuts

| Shortcut | Action |
| :--- | :--- |
| <kbd>Shift</kbd> + <kbd>T</kbd> / <kbd>Shift</kbd> + <kbd>R</kbd> | Pick video element on page |
| <kbd>Enter</kbd> | Search / Fetch media |

---

## 📄 License

This open-source project serves educational and research purposes.
