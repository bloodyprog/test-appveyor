@echo off

cd build

appveyor DownloadFile https://github.com/premake/premake-core/releases/download/v5.0.0-alpha8/premake-5.0.0-alpha8-windows.zip
7z x premake-5.0.0-alpha8-windows.zip
premake5.exe --version
premake5.exe %VS_VERSION%

cd ..