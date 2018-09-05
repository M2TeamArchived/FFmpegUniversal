@setlocal EnableDelayedExpansion
@echo off

set VisualStudioInstallerFolder="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer"
if %PROCESSOR_ARCHITECTURE%==x86 set VisualStudioInstallerFolder="%ProgramFiles%\Microsoft Visual Studio\Installer"

pushd %VisualStudioInstallerFolder%
for /f "usebackq tokens=*" %%i in (`vswhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath`) do (
  set VisualStudioInstallDir=%%i
)
popd

if %1==x86 set VisualStudioToolKitType=x86
if %1==x64 set VisualStudioToolKitType=x86_amd64
if %1==ARM set VisualStudioToolKitType=x86_arm
if %1==ARM64  set VisualStudioToolKitType=x86_arm64

call "%VisualStudioInstallDir%\VC\Auxiliary\Build\vcvarsall.bat" %VisualStudioToolKitType% uwp

echo Building FFmpeg for Windows 10 apps x86...
echo:

%MSYS2_BIN% --login -x "%~dp0BuildFFmpeg.sh" Static %1
%MSYS2_BIN% --login -x "%~dp0BuildFFmpeg.sh" Shared %1

set FFmpegUniversalProjectDir=%~dp0..

set FFmpegOutPutDir=%FFmpegUniversalProjectDir%\OutPut\FFmpeg
set FFmpegUniversalOutPutDir=%FFmpegUniversalProjectDir%\OutPut\FFmpegUniversal\%1
set FFmpegUniversalTempDir=%FFmpegUniversalProjectDir%\OutPut\FFmpegUniversal_Temp\%1

mkdir "%FFmpegUniversalTempDir%"
mkdir "%FFmpegUniversalOutPutDir%\Include"
mkdir "%FFmpegUniversalOutPutDir%\Lib"
mkdir "%FFmpegUniversalOutPutDir%\Redist"

rem Generate the DLL export symbols list file
copy /y "%FFmpegOutPutDir%\Shared\%1\lib\*.def" "%FFmpegUniversalTempDir%\FFmpegUniversal.def"

rem Copy the header files to the Output Folder
xcopy /r /s /y "%FFmpegOutPutDir%\Static\%1\include\*.*" "%FFmpegUniversalOutPutDir%\Include"

rem Compile the resource file
rc /D "_UNICODE" /D "UNICODE" /l 0x0409 /nologo /fo"%FFmpegUniversalTempDir%\FFmpegUniversal.res"  "%FFmpegUniversalProjectDir%\FFmpegUniversal\FFmpegUniversal.rc"

rem Set the linked file list
set LinkerInput="%FFmpegUniversalTempDir%\FFmpegUniversal.res"
for /f %%i in ('dir /b "%FFmpegOutPutDir%\Static\%1\lib\*.a"') do (set LinkerInput="%FFmpegOutPutDir%\Static\%1\lib\%%i" !LinkerInput!)

rem Link all files
link /MANIFEST:NO /NXCOMPAT /DYNAMICBASE "WindowsApp.lib" /DEBUG:FULL /DLL /WINMD:NO /APPCONTAINER /OPT:REF /SUBSYSTEM:CONSOLE /OPT:ICF /ERRORREPORT:PROMPT /NOLOGO /TLBID:1 /OUT:"%FFmpegUniversalOutPutDir%\Redist\FFmpegUniversal.dll" /PDB:"%FFmpegUniversalOutPutDir%\Redist\FFmpegUniversal.pdb" /DEF:"%FFmpegUniversalTempDir%\FFmpegUniversal.def" /IMPLIB:"%FFmpegUniversalOutPutDir%\Lib\FFmpegUniversal.lib" /MACHINE:%1 %LinkerInput%


@endlocal