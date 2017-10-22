#!/bin/bash
# 5.8.1. Installation of Target Libstdc++ 
cd $LFS/sources/gcc-7.2.0

## Create a separate build directory for Libstdc++ and enter it:
mkdir -v build
cd       build

## Prepare Libstdc++ for compilation:
../libstdc++-v3/configure           \
    --host=$LFS_TGT                 \
    --prefix=/tools                 \
    --disable-multilib              \
    --disable-nls                   \
    --disable-libstdcxx-threads     \
    --disable-libstdcxx-pch         \
    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/7.2.0

## Compile libstdc++ by running:
make

## Install the library:
make install

cd $LFS/sources && rm -rf gcc-7.2.0
