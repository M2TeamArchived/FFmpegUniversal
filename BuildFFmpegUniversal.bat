@setlocal
@echo off

rem Set the code page to reduce the compilation warnings
chcp 65001

rem Export full current PATH from environment into MSYS2
set MSYS2_PATH_TYPE=inherit

rem Set the MSYS2 bash path
set MSYS2_BIN="G:\Tools\msys64\usr\bin\bash.exe"

rd /s /q "%~dp0Output"

call "%~dp0FFmpegUniversal\BuildFFmpegUniversalInternal.bat" x86
call "%~dp0FFmpegUniversal\BuildFFmpegUniversalInternal.bat" x64
call "%~dp0FFmpegUniversal\BuildFFmpegUniversalInternal.bat" ARM
call "%~dp0FFmpegUniversal\BuildFFmpegUniversalInternal.bat" ARM64

@endlocal