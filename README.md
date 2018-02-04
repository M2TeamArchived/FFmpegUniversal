# FFmpegUniversal

Merged FFmpeg dynamic library for the Windows Universal Platform.

## Prerequisites
Getting a compatible build of FFmpeg is required for this to work.

You can get the code for [FFmpeg on Github](http://github.com/FFmpeg) yourself
by cloning 
[git://source.ffmpeg.org/ffmpeg.git](git://source.ffmpeg.org/ffmpeg.git).

Your `FFmpegUniversal` folder should look as follows

	FFmpegUniversal\
	  FFmpeg\             - ffmpeg source code from the latest release in 
	                        git://github.com/FFmpeg/FFmpeg.git
	  FFmpegUniversal\    - FFmpegUniversal WinRT dll
	  FFmpegBuild.bat     - Helper script to build FFmpeg libraries as 
	                        described in 
	                        https://trac.ffmpeg.org/wiki/CompilationGuide/WinRT
	  FFmpegConfig.sh     - Internal script that contains FFmpeg configure 
	                        options
	  FFmpegCopy.bat      - Helper script to to copy the appropriate builds of 
	                        FFmpeg libraries to the FFmpegUniversal project.
	  FFmpegUniversal.sln - Microsoft Visual Studio 2017 solution file
	  LICENSE
	  README.md

Now that you have the FFmpeg source code, you can follow the instructions on 
how to 
[build FFmpeg for WinRT](https://trac.ffmpeg.org/wiki/CompilationGuide/WinRT) 
apps. Follow the setup instruction carefuly to avoid build issues. After 
completing the setup as instructed, you can invoke `FFmpegBuild.bat` script to 
build or do it manually using the instructions in the compilation guide.

	BuildFFmpeg.bat    - Build for Windows 10 ARM, x64, and x86

If you use the build script or follow the Wiki instructions as is you should 
find the appropriate builds of FFmpeg libraries in the `Output/FFmpeg` folders.

Finally open the FFmpegUniversal.sln and build it, you will get the merged 
FFmpeg dynamic library for the Windows Universal Platform.

## License
Same as the FFmpeg, distributed under the [LGPL version 2.1 or later](LICENSE).

### M2-Team