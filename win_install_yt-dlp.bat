@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set "APP_DIR=%~dp0"

:: 1. Check if yt-dlp exists in system PATH
where yt-dlp >nul 2>&1
if %errorlevel% equ 0 (
    set "YTDLP=yt-dlp"
    echo 📌 Found yt-dlp in system PATH!
    goto :READY
)
set "YTDLP=%APP_DIR%yt-dlp.exe"
if exist "%YTDLP%" (
    echo 📌 Found yt-dlp in the script directory!
    goto :READY
)

:: 2. download if missing
set "ARCH=win_64"
if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    if not defined PROCESSOR_ARCHITEW6432 set "ARCH=win_32"
)
if "%PROCESSOR_ARCHITECTURE%"=="ARM64" set "ARCH=win_arm64"

echo ⚡ [FAST] yt-dlp not found. Downloading [%ARCH%] version...
if "%ARCH%"=="win_32" (
    set "YTDLP_URL=https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_x86.exe"
) else (
    if "%ARCH%"=="win_arm64" (
        set "YTDLP_URL=https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_arm64.exe"
    ) else (
        set "YTDLP_URL=https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
    )
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '!YTDLP_URL!' -OutFile '%YTDLP%'"

:READY
echo 🚀 yt-dlp is ready to use! Target: %YTDLP%
pause