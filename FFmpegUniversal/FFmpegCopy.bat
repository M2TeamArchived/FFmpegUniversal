@setlocal
@echo off

pushd %~dp0..\

xcopy /r /s /y Output\FFmpeg\Static\%1\include\*.* FFmpegUniversal\FFmpeg\Include\
xcopy /r /s /y Output\FFmpeg\Static\%1\lib\*.a FFmpegUniversal\FFmpeg\Lib\ARM\

popd

:Cleanup

@endlocal