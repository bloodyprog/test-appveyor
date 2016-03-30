@echo off

pushd %~dp0

if not exist "dependencies" (mkdir "dependencies")
cd dependencies

set nunit_url="https://github.com/nunit/nunit/releases/download/3.2.0/NUnit-3.2.0.zip"
set nunit_file="NUnit-3.2.0.zip"
set nunit_dir="nunit"

if not exist %nunit_file% (wget --no-check-certificate %nunit_url%)

if not exist %nunit_dir% (
    7z x -r -o%nunit_dir% %nunit_file%
)

popd
