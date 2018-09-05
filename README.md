# FFmpegUniversal

Merged FFmpeg dynamic linked library for the Windows Universal Platform.

## The structure of the `FFmpegUniversal` folder

    FFmpegUniversal\                      - The Root Folder
      FFmpeg\                             - Git Submodule of FFmpeg source code
                                            from the latest stable release in 
                                            git://github.com/FFmpeg/FFmpeg.git
      FFmpegUniversal\                    - FFmpegUniversal Generate WinRT DLL 
                                            Project
        BuildFFmpeg.sh                    - Internal script for compiling 
                                            FFmpeg
        BuildFFmpegUniversalInternal.bat  - Internal script for compiling 
                                            FFmpegUniversal
        FFmpegUniversal.rc                - FFmpegUniversal Version Info 
                                            Resource Definition
        Version.h                         - FFmpegUniversal Version Definition
      Output\                             - Output Folder
        FFmpeg\                           - Temporary files of FFmpegUniversal 
                                            compilation (Compiled binaries of 
                                            FFmpeg)
        FFmpeg_Temp\                      - Temporary files of FFmpegUniversal 
                                            compilation (Temporary files of 
                                            FFmpeg compilation)        
        FFmpegUniversal\                  - *FFmpegUniversal Compiled binaries*
          { ARM, ARM64, x64, x86 }\       - Platform Folder
            Include\                      - The header files for using 
                                            FFmpegUniversal
            Lib\                          - The library files for linking 
                                            FFmpegUniversal
            Redist\                       - The binary files of FFmpegUniversal
        FFmpegUniversal_Temp\             - Temporary files of FFmpegUniversal 
                                            compilation
      .gitignore                          - Git ignore definition file
      .gitmodules                         - Git submodule definition file
      BuildFFmpegUniversal.bat            - *The script for compiling 
                                            FFmpegUniversal*
      LICENSE                             - The License file
      README.md                           - This document


## How to compile

You can follow the instructions on how to 
[build FFmpeg for WinRT](https://trac.ffmpeg.org/wiki/CompilationGuide/WinRT) 
apps. Follow the setup instruction carefuly to avoid build issues. After 
completing the setup as instructed, you can invoke `BuildFFmpegUniversal.bat` 
script to build or do it manually using the instructions in the compilation 
guide after you modify the MSYS2_BIN variable in the 
`BuildFFmpegUniversal.bat`.

    BuildFFmpegUniversal.bat    - *The script for compiling FFmpegUniversal*

If you use the build script or follow the Wiki instructions as is you will get
the merged FFmpeg dynamic library for the Windows Universal Platform and you 
should find the appropriate builds of FFmpegUniversal libraries in the 
`Output\FFmpegUniversal` folders. 

Finally, enjoy it.

## License
Same as the FFmpeg, the default setting of FFmpeg compilation in FFmpegUniversal 
is distributed under the [LGPL version 2.1 or later](LICENSE).

### M2-Team