@echo off

mkdir test_sqlite
cd test_sqlite

appveyor DownloadFile https://www.sqlite.org/2016/sqlite-amalgamation-3110100.zip
appveyor DownloadFile https://www.sqlite.org/2016/sqlite-dll-win64-x64-3110100.zip
7z x sqlite-amalgamation-3110100.zip
7z x sqlite-dll-win64-x64-3110100.zip
dir

cd ..
