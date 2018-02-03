@setlocal
@echo off

echo FFmpegUniversal Config [Version 0.1.0]
echo (c) M2-Team. All rights reserved.
echo.

pushd %~dp0


set /p FFmpegVersion=Which version of FFmpeg do you want to download (3.4.1)?
git clone --branch n%FFmpegVersion% https://github.com/FFmpeg/FFmpeg.git FFmpeg


:Cleanup

@endlocal