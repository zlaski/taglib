@echo off
setlocal EnableExtensions EnableDelayedExpansion

set OutDir=%~1

pushd %~dp0

set QDIR="%OutDir%..\include\taglib\"
mkdir %QDIR%

for /F %%H in (taglib-headers.lst) do (
    echo %%H
    xcopy /i /r /y /q %%H %QDIR% >nul
)

echo taglib\taglib_config.h.cmake
echo EMPTY >%QDIR%taglib_config.h
xcopy /r /y /q taglib\taglib_config.h.cmake %QDIR%taglib_config.h >nul

pushd %QDIR%
attrib +R /S
popd

popd
