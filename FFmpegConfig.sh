#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ "$1" == "Static" ]; then
    echo "Make Win10 Static"

    if [ "$2" == "x86" ]; then
        echo "Make Win10 x86"
        pushd $DIR/FFmpeg
        rm -rf ../Output/FFmpeg_Temp/Static/x86
        mkdir -p ../Output/FFmpeg_Temp/Static/x86
        cd ../Output/FFmpeg_Temp/Static/x86
        ../../../../FFmpeg/configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=x86 \
		--enable-static \
		--disable-debug \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
        --prefix=../../../../Output/FFmpeg/Static/x86
        make install
        popd

    elif [ "$2" == "x64" ]; then
        echo "Make Win10 x64"
        pushd $DIR/ffmpeg
        rm -rf ../Output/FFmpeg_Temp/Static/x64
        mkdir -p ../Output/FFmpeg_Temp/Static/x64
        cd ../Output/FFmpeg_Temp/Static/x64
        ../../../../FFmpeg/configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
		--enable-static \
		--disable-debug \
        --arch=x86_64 \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
        --prefix=../../../../Output/FFmpeg/Static/x64
        make install
        popd

    elif [ "$2" == "ARM" ]; then
        echo "Make Win10 ARM"
        pushd $DIR/ffmpeg
        rm -rf ../Output/FFmpeg_Temp/Static/ARM
        mkdir -p ../Output/FFmpeg_Temp/Static/ARM
        cd ../Output/FFmpeg_Temp/Static/ARM
         ../../../../FFmpeg/configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=arm \
		--enable-static \
		--disable-debug \
        --as=armasm \
        --cpu=armv7 \
        --enable-thumb \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 -D__ARM_PCS_VFP" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
        --prefix=../../../../Output/FFmpeg/Static/ARM
        make install
        popd

	elif [ "$2" == "ARM64" ]; then
        echo "Make Win10 ARM64"
        pushd $DIR/ffmpeg
        rm -rf ../Output/FFmpeg_Temp/Static/ARM64
        mkdir -p ../Output/FFmpeg_Temp/Static/ARM64
        cd ../Output/FFmpeg_Temp/Static/ARM64
         ../../../../FFmpeg/configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=aarch64 \
		--enable-static \
		--disable-debug \
        --as=armasm64 \
        --cpu=armv8 \
        --enable-thumb \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 -D__ARM_PCS_VFP" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
        --prefix=../../../../Output/FFmpeg/Static/ARM64
        make install
        popd

    fi
	
elif [ "$1" == "Shared" ]; then

	echo "Make Win10 Shared"

    if [ "$2" == "x86" ]; then
        echo "Make Win10 x86"
        pushd $DIR/ffmpeg
        rm -rf ../Output/FFmpeg_Temp/Shared/x86
        mkdir -p ../Output/FFmpeg_Temp/Shared/x86
        cd ../Output/FFmpeg_Temp/Shared/x86
         ../../../../FFmpeg/configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=x86 \
		--enable-shared \
		--disable-debug \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
        --prefix=../../../../Output/FFmpeg/Shared/x86
        make install
        popd

    elif [ "$2" == "x64" ]; then
        echo "Make Win10 x64"
        pushd $DIR/ffmpeg
        rm -rf ../Output/FFmpeg_Temp/Shared/x64
        mkdir -p ../Output/FFmpeg_Temp/Shared/x64
        cd ../Output/FFmpeg_Temp/Shared/x64
         ../../../../FFmpeg/configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
		--enable-shared \
		--disable-debug \
        --arch=x86_64 \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
        --prefix=../../../../Output/FFmpeg/Shared/x64
        make install
        popd

    elif [ "$2" == "ARM" ]; then
        echo "Make Win10 ARM"
        pushd $DIR/ffmpeg
        rm -rf ../Output/FFmpeg_Temp/Shared/ARM
        mkdir -p ../Output/FFmpeg_Temp/Shared/ARM
        cd ../Output/FFmpeg_Temp/Shared/ARM
         ../../../../FFmpeg/configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=arm \
		--enable-shared \
		--disable-debug \
        --as=armasm \
        --cpu=armv7 \
        --enable-thumb \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 -D__ARM_PCS_VFP" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
        --prefix=../../../../Output/FFmpeg/Shared/ARM
        make install
        popd

	elif [ "$2" == "ARM64" ]; then
        echo "Make Win10 ARM64"
        pushd $DIR/ffmpeg
        rm -rf ../Output/FFmpeg_Temp/Shared/ARM64
        mkdir -p ../Output/FFmpeg_Temp/Shared/ARM64
        cd ../Output/FFmpeg_Temp/Shared/ARM64
         ../../../../FFmpeg/configure \
        --toolchain=msvc \
        --disable-programs \
        --disable-d3d11va \
        --disable-dxva2 \
        --arch=aarch64 \
		--enable-shared \
		--disable-debug \
        --as=armasm64 \
        --cpu=armv8 \
        --enable-thumb \
        --enable-cross-compile \
        --target-os=win32 \
        --extra-cflags="-MD -DWINAPI_FAMILY=WINAPI_FAMILY_APP -D_WIN32_WINNT=0x0A00 -D__ARM_PCS_VFP" \
        --extra-ldflags="-APPCONTAINER WindowsApp.lib" \
        --prefix=../../../../Output/FFmpeg/Shared/ARM64
        make install
        popd

    fi

fi

exit 0