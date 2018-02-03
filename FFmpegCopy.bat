@setlocal
@echo off

pushd %~dp0

xcopy /r /s /y Output\FFmpeg\Static\x86\include\*.* FFmpegUniversal\FFmpeg\Include\
xcopy /r /s /y Output\FFmpeg\Static\ARM\lib\*.a FFmpegUniversal\FFmpeg\Lib\ARM\
xcopy /r /s /y Output\FFmpeg\Static\x86\lib\*.a FFmpegUniversal\FFmpeg\Lib\Win32\
xcopy /r /s /y Output\FFmpeg\Static\x64\lib\*.a FFmpegUniversal\FFmpeg\Lib\x64\

:Cleanup

@endlocal