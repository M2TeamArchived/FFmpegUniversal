#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

OPTIONS=
OPTIONS="$OPTIONS --toolchain=msvc --disable-programs --disable-d3d11va"
OPTIONS="$OPTIONS --disable-dxva2 --disable-debug --enable-cross-compile"
OPTIONS="$OPTIONS --target-os=win32 --prefix=../../../../Output/FFmpeg/$1/$2"

FFMPEG_CFLAGS="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00"
FFMPEG_LDFLAGS="-APPCONTAINER WindowsApp.lib"

if [ "$1" == "Static" ]; then   
	OPTIONS="$OPTIONS --enable-static"
	
elif [ "$1" == "Shared" ]; then
	OPTIONS="$OPTIONS --enable-shared"

fi

if [ "$2" == "Win32" ]; then
	OPTIONS="$OPTIONS --arch=x86"
	FFMPEG_CFLAGS="$FFMPEG_CFLAGS"

elif [ "$2" == "x64" ]; then
	OPTIONS="$OPTIONS --arch=x86_64"
	FFMPEG_CFLAGS="$FFMPEG_CFLAGS"

elif [ "$2" == "ARM" ]; then
	OPTIONS="$OPTIONS --arch=arm --as=armasm --cpu=armv7 --enable-thumb"
	FFMPEG_CFLAGS="$FFMPEG_CFLAGS -D__ARM_PCS_VFP"

elif [ "$2" == "ARM64" ]; then
	OPTIONS="$OPTIONS --arch=aarch64 --as=armasm64 --cpu=armv8 --enable-thumb"
	FFMPEG_CFLAGS="$FFMPEG_CFLAGS -D__ARM_PCS_VFP"

fi

echo "Make Win10 $1 $2"
pushd $DIR/FFmpeg
rm -rf ../Output/FFmpeg_Temp/$1/$2
mkdir -p ../Output/FFmpeg_Temp/$1/$2
cd ../Output/FFmpeg_Temp/$1/$2
../../../../FFmpeg/configure \
	$OPTIONS \
	--extra-cflags="$FFMPEG_CFLAGS" \
	--extra-ldflags="$FFMPEG_LDFLAGS"
make install

popd

exit 0