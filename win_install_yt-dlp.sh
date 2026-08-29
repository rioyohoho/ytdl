#!/usr/bin/env bash
set -e

# Get current script directory
APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Check if yt-dlp is already in system PATH
if command -v yt-dlp >/dev/null 2>&1; then
    echo "📌 Found yt-dlp in system PATH!"
    echo "🚀 yt-dlp is ready to use: $(command -v yt-dlp)"
    exit 0
fi

# Check if yt-dlp binary exists in the script directory
YTDLP="$APP_DIR/yt-dlp"
if [ -f "$YTDLP" ] && [ -x "$YTDLP" ]; then
    echo "📌 Found yt-dlp in script directory!"
    echo "🚀 yt-dlp is ready to use: $YTDLP"
    exit 0
fi

# 2. Detect OS and CPU Architecture
OS="$(uname -s)"
ARCH="$(uname -m)"

echo "🔍 Detecting system: OS=[$OS], ARCH=[$ARCH]..."

case "$OS" in
    Darwin*) # macOS (Intel & Apple Silicon M1/M2/M3/M4)
        YTDLP_URL="https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_macos"
        ;;
    Linux*) # Linux
        case "$ARCH" in
            x86_64|amd64)
                YTDLP_URL="https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux"
                ;;
            aarch64|arm64)
                YTDLP_URL="https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux_aarch64"
                ;;
            armv7l|armv6l)
                YTDLP_URL="https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux_armv7l"
                ;;
            *)
                # Fallback to standalone python zipapp for other architectures
                YTDLP_URL="https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp"
                ;;
        esac
        ;;
    *)
        echo "❌ Unsupported OS: $OS"
        exit 1
        ;;
esac

# 3. Download the binary
echo "⚡ Downloading yt-dlp from: $YTDLP_URL"

if command -v curl >/dev/null 2>&1; then
    curl -L --progress-bar "$YTDLP_URL" -o "$YTDLP"
elif command -v wget >/dev/null 2>&1; then
    wget -q --show-progress -O "$YTDLP" "$YTDLP_URL"
else
    echo "❌ Error: Neither 'curl' nor 'wget' was found. Please install one of them."
    exit 1
fi

# 4. Grant execute permissions
chmod a+rx "$YTDLP"

# 5. Verify installation
if [ -f "$YTDLP" ] && [ -x "$YTDLP" ]; then
    echo "=========================================="
    echo "🎉 yt-dlp installed successfully!"
    echo "📍 Location: $YTDLP"
    echo "📌 Version : $("$YTDLP" --version)"
    echo "=========================================="
else
    echo "❌ Installation failed!"
    exit 1
fi