# FFmpegUniversal

Merged FFmpeg dynamic linked library for the Windows Universal Platform.

## Prerequisites
You can follow the instructions on how to 
[build FFmpeg for WinRT](https://trac.ffmpeg.org/wiki/CompilationGuide/WinRT) 
apps. Follow the setup instruction carefuly to avoid build issues. After 
completing the setup as instructed, you can invoke `FFmpegBuild.bat` script to 
build or do it manually using the instructions in the compilation guide after 
you modify the MSYS2_BIN variable in the `FFmpegBuild.bat`.

	BuildFFmpeg.bat    - Build for Windows 10 ARM, x64, and x86

If you use the build script or follow the Wiki instructions as is you should 
find the appropriate builds of FFmpeg libraries in the `Output/FFmpeg` folders.

Simply open the FFmpegUniversal.sln and build the FFmpegUniversal, you will get
the merged FFmpeg dynamic library for the Windows Universal Platform. Then, you
copy the FFmpegUniversalSDK folder to your Visual Studio solution folder and add
it to your solution and use "add reference" to add it to your project. 

Finally, enjoy it.

## License
Same as the FFmpeg, the default setting of FFmpeg compilation in FFmpegUniversal 
is distributed under the [LGPL version 2.1 or later](LICENSE).

### M2-Team