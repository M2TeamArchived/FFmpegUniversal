@setlocal
@echo off

pushd %~dp0

xcopy /r /s /y Output\FFmpeg\Static\%1\include\*.* FFmpegUniversalSDK\

xcopy /r /s /y Output\FFmpeg\Static\%1\lib\*.a FFmpegUniversal\FFmpeg\Lib\%1\
copy /y Output\FFmpeg\Shared\%1\lib\*.def FFmpegUniversal\FFmpeg\Lib\%1\FFmpegUniversal.def

popd

:Cleanup

@endlocal