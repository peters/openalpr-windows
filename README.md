# openalpr-windows

Build [OpenALPR](https://github.com/openalpr/openalpr) on Windows. This repository contains all needed dependencies.

NB! If you want to enable CUDA-support for OpenCV add `-CudaGeneration <Kepler|Fermi>` when executing `build.ps1`

## Current version
* [2.0.1](https://github.com/openalpr/openalpr/releases/tag/v2.1.0)

## Need to build a older version?
* `git tag -l`
* `git checkout vX.X.X`

## Build output directories
* `build\artificats\<version>\<toolchain>\<configuration>\<platform>` - Raw build output
* `build\dist\<version>\<toolchain>\<configuration>\<platform>` - Final build output

## Prerequisites
* Visual Studio 
* CUDA SDK 7 (Only if you need CUDA support)
* GIT

## Getting started

* `git clone https://github.com/openalpr/openalpr.git`
* `cd openalpr`
* `git clone https://github.com/peters/openalpr-windows.git windows`
* `git submodule update --init --recursive`
* `cd windows`

## Build a release build for x64 targeting toolchain v120
* `.\build.ps1 -Configuration Release -Platform x64 -PlatformToolset v120 -CudaGeneration None`

## Build a debug/release build for x64 targeting toolchain v120
* `.\build.ps1 -Configuration Debug -Platform x64 -PlatformToolset v120 -CudaGeneration None`
* `.\build.ps1 -Configuration Release -Platform x64 -PlatformToolset v120 -CudaGeneration None`

## Build entire matrix for toolchains v100, v110, v120, v140 with CUDA support.
* `.\build.all.ps1 -CudeGeneration All`

## OpenALPR dependencies

* Giflib 4.1.6
* LibJPEG 8c
* Leptonica 1.7.1
* Libpng 1.4.3
* Libtiff 3.9.4
* Zlib 1.2.8
* Tesseract 3.04-rc1
* OpenCV 2.4.8

## Supported platforms

* Windows 7
* Windows 8.1
* Windows 10

## Supported platform architectures

* Win32 (x86)
* X64 (AMD64)

## Supported toolchains

* v100 (Visual Studio 2010)
* v110 (Visual Studio 2012)
* v120 (Visual Studio 2013)
* v140 (Visual Studio 2015)

## License

MIT.
