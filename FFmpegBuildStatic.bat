@setlocal
rem @echo off

set MSYS2_PATH_TYPE=inherit

rem Set the environment variable
set MSYS2_BIN="E:\Tools\msys64\usr\bin\bash.exe"
set VS2017_DIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community

echo Building FFmpeg for Windows 10 apps x86...
echo:

setlocal
call "%VS2017_DIR%\VC\Auxiliary\Build\vcvarsall.bat" x86 uwp 10.0.10240.0
set INCLUDE=%VCToolsInstallDir%include;%VCToolsInstallDir%atlmfc\include;%WindowsSdkDir%Include\%WindowsSDKLibVersion%ucrt;%WindowsSdkDir%Include\%WindowsSDKLibVersion%um;%WindowsSdkDir%Include\%WindowsSDKLibVersion%shared;%WindowsSdkDir%Include\%WindowsSDKLibVersion%winrt;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6\Include\um;
set LIB=%VCToolsInstallDir%lib\x86\store;%VCToolsInstallDir%atlmfc\lib\x86;%WindowsSdkDir%lib\%WindowsSDKLibVersion%ucrt\x86;%WindowsSdkDir%lib\%WindowsSDKLibVersion%um\x86;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6\lib\um\x86;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6\Lib\um\x86
set LIBPATH=%VCToolsInstallDir%ATLMFC\lib\x86;%VCToolsInstallDir%lib\x86;

start "" %MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh Static x86
start "" %MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh Shared x86
endlocal

echo Building FFmpeg for Windows 10 apps x64...
echo:

setlocal
call "%VS2017_DIR%\VC\Auxiliary\Build\vcvarsall.bat" x86_amd64 uwp 10.0.10240.0
set INCLUDE=%VCToolsInstallDir%include;%VCToolsInstallDir%atlmfc\include;%WindowsSdkDir%Include\%WindowsSDKLibVersion%ucrt;%WindowsSdkDir%Include\%WindowsSDKLibVersion%um;%WindowsSdkDir%Include\%WindowsSDKLibVersion%shared;%WindowsSdkDir%Include\%WindowsSDKLibVersion%winrt;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6\Include\um;
set LIB=%VCToolsInstallDir%lib\x64\store;%VCToolsInstallDir%atlmfc\lib\x64;%WindowsSdkDir%lib\%WindowsSDKLibVersion%ucrt\x64;%WindowsSdkDir%lib\%WindowsSDKLibVersion%um\x64;C:\Program Files (x64)\Windows Kits\NETFXSDK\4.6\lib\um\x64;C:\Program Files (x64)\Windows Kits\NETFXSDK\4.6\Lib\um\x64
set LIBPATH=%VCToolsInstallDir%ATLMFC\lib\x64;%VCToolsInstallDir%lib\x64;

start "" %MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh Static x64
start "" %MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh Shared x64
endlocal

echo Building FFmpeg for Windows 10 apps ARM...
echo:

setlocal
call "%VS2017_DIR%\VC\Auxiliary\Build\vcvarsall.bat" x86_arm uwp 10.0.10240.0
set INCLUDE=%VCToolsInstallDir%include;%VCToolsInstallDir%atlmfc\include;%WindowsSdkDir%Include\%WindowsSDKLibVersion%ucrt;%WindowsSdkDir%Include\%WindowsSDKLibVersion%um;%WindowsSdkDir%Include\%WindowsSDKLibVersion%shared;%WindowsSdkDir%Include\%WindowsSDKLibVersion%winrt;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6\Include\um;
set LIB=%VCToolsInstallDir%lib\arm\store;%VCToolsInstallDir%atlmfc\lib\arm;%WindowsSdkDir%lib\%WindowsSDKLibVersion%ucrt\arm;%WindowsSdkDir%lib\%WindowsSDKLibVersion%um\arm;C:\Program Files (arm)\Windows Kits\NETFXSDK\4.6\lib\um\arm;C:\Program Files (arm)\Windows Kits\NETFXSDK\4.6\Lib\um\arm
set LIBPATH=%VCToolsInstallDir%ATLMFC\lib\arm;%VCToolsInstallDir%lib\arm;

start "" %MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh Static ARM
start "" %MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh Shared ARM
endlocal

echo Building FFmpeg for Windows 10 apps ARM64...
echo:

setlocal
call "%VS2017_DIR%\VC\Auxiliary\Build\vcvarsall.bat" x86_arm64 uwp 10.0.10240.0
set INCLUDE=%VCToolsInstallDir%include;%VCToolsInstallDir%atlmfc\include;%WindowsSdkDir%Include\%WindowsSDKLibVersion%ucrt;%WindowsSdkDir%Include\%WindowsSDKLibVersion%um;%WindowsSdkDir%Include\%WindowsSDKLibVersion%shared;%WindowsSdkDir%Include\%WindowsSDKLibVersion%winrt;C:\Program Files (x86)\Windows Kits\NETFXSDK\4.6\Include\um;
set LIB=%VCToolsInstallDir%lib\arm64\store;%VCToolsInstallDir%atlmfc\lib\arm64;%WindowsSdkDir%lib\%WindowsSDKLibVersion%ucrt\arm64;%WindowsSdkDir%lib\%WindowsSDKLibVersion%um\arm64;C:\Program Files (arm64)\Windows Kits\NETFXSDK\4.6\lib\um\arm64;C:\Program Files (arm64)\Windows Kits\NETFXSDK\4.6\Lib\um\arm64
set LIBPATH=%VCToolsInstallDir%ATLMFC\lib\arm64;%VCToolsInstallDir%lib\arm64;

start "" %MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh Static ARM64
start "" %MSYS2_BIN% --login -x %~dp0FFmpegConfig.sh Shared ARM64
endlocal

:Cleanup

@endlocal