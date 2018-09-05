#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

OPTIONS=

if [ "$1" == "Static" ]; then   
	OPTIONS="$OPTIONS --enable-static"
	
elif [ "$1" == "Shared" ]; then
	OPTIONS="$OPTIONS --enable-shared"

fi

if [ "$2" == "x86" ]; then
	OPTIONS="$OPTIONS --arch=x86"

elif [ "$2" == "x64" ]; then
	OPTIONS="$OPTIONS --arch=x86_64"

elif [ "$2" == "ARM" ]; then
	OPTIONS="$OPTIONS --arch=arm"

elif [ "$2" == "ARM64" ]; then
	OPTIONS="$OPTIONS --arch=aarch64"
	
fi

pushd $DIR/../FFmpeg
echo "=== CONFIGURING ==="
rm -rf ../Output/FFmpeg/$1/$2
rm -rf ../Output/FFmpeg_Temp/$1/$2
mkdir -p ../Output/FFmpeg_Temp/$1/$2
cd ../Output/FFmpeg_Temp/$1/$2
../../../../FFmpeg/configure \
	--toolchain=msvc \
	--disable-programs \
	--enable-cross-compile \
	--enable-debug \
	--disable-doc \
	--target-os=win32 \
	--extra-cflags=-DWINAPI_FAMILY=WINAPI_FAMILY_APP \
	--extra-cflags=-D_WIN32_WINNT=0x0A00 \
	--extra-cflags=-DHAVE_UNISTD_H=0 \
	--extra-ldflags=-APPCONTAINER \
	--extra-ldflags=WindowsApp.lib \
	--extra-cflags=-MD \
	--extra-cxxflags=-MD \
	$OPTIONS \
	--prefix=../../../../Output/FFmpeg/$1/$2
echo "=== BUILDING ==="
make -j12
echo "=== INSTALLING ==="
make install

popd

exit 0