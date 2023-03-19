:: taglib.vcxproj pre-build 
@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "ProjectDir=%~dp0"
set "SolutionPath=%~1"
set "IntDir=%~2"
set "OutDir=%~3"


pushd "%ProjectDir%"

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
