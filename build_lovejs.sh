#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p build/release build/compat

source ~/git/emsdk/emsdk_env.sh

(
  cd build/release
  emcmake cmake /Users/dkhachat/git/megasource -G "Unix Makefiles" -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release
  emmake make -j 6
  cp love/love.js* ../../src/release
  cp love/love.wasm ../../src/release
  cp love/love.worker.js ../../src/release
)

(
  cd build/compat
  emcmake cmake /Users/dkhachat/git/megasource -G "Unix Makefiles" -DLOVE_JIT=0 -DCMAKE_BUILD_TYPE=Release -DLOVEJS_COMPAT=1
  emmake make -j 6
  cp love/love.js* ../../src/compat
  cp love/love.wasm ../../src/compat
  cp love/love.worker.js ../../src/compat
)
