@echo off

pushd %~dp0\..\output\bin\debug

TestCpp.exe --reporter junit --out TestCpp.results.xml
TestCSharp.exe

popd

if %ERRORLEVEL% neq 0 (
    echo TestErrors
    exit 0
)
