@echo off
mkdir build
mkdir build\release
mkdir build\compat

call C:\Users\Grigor\git\emsdk\emsdk_env

(
cd build\release
emcmake cmake C:\Users\Grigor\git\megasource -G "Unix Makefiles" -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release
emmake make -j 6
copy "love\love.js*" ..\..\src\release
copy "love\love.wasm" ..\..\src\release
copy "love\love.worker.js" ..\..\src\release

cd ..\..

cd build\compat
emcmake cmake C:\Users\Grigor\git\megasource -G "Unix Makefiles" -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release -DLOVEJS_COMPAT=1
emmake make -j 6
copy "love\love.js*" ..\..\src\compat
copy "love\love.wasm" ..\..\src\compat
)