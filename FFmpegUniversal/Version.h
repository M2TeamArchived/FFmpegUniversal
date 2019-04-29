/******************************************************************************
Project: FFmpegUniversal
Description: FFmpegUniversal Version Definition
File Name: Version.h
License: LGPL version 2.1 or later
******************************************************************************/

#ifndef FFMPEG_VER
#define FFMPEG_VER

#define FFMPEG_VER_MAJOR 4
#define FFMPEG_VER_MINOR 1
#define FFMPEG_VER_BUILD 3
#define FFMPEG_VER_REV 0
#endif

#ifndef FFMPEG_VER_FMT_COMMA
#define FFMPEG_VER_FMT_COMMA FFMPEG_VER_MAJOR,FFMPEG_VER_MINOR,FFMPEG_VER_BUILD,FFMPEG_VER_REV
#endif

#ifndef FFMPEG_VER_FMT_DOT
#define FFMPEG_VER_FMT_DOT FFMPEG_VER_MAJOR.FFMPEG_VER_MINOR.FFMPEG_VER_BUILD.FFMPEG_VER_REV
#endif


#ifndef MACRO_TO_STRING
#define _MACRO_TO_STRING(arg) L#arg
#define MACRO_TO_STRING(arg) _MACRO_TO_STRING(arg)
#endif

#ifndef FFMPEG_VERSION
#define FFMPEG_VERSION FFMPEG_VER_FMT_COMMA
#endif

#ifndef FFMPEG_VERSION_STRING
#define FFMPEG_VERSION_STRING MACRO_TO_STRING(FFMPEG_VER_FMT_DOT)
#endif
