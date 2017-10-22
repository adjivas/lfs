#!/bin/bash
# 5.9.1. Installation of Binutils 
cd $LFS/sources/binutils-2.29

## Create a separate build directory again:
mkdir -v build
cd       build

## Prepare Binutils for compilation:
CC=$LFS_TGT-gcc                \
    AR=$LFS_TGT-ar             \
    RANLIB=$LFS_TGT-ranlib     \
    ../configure               \
    --prefix=/tools            \
    --disable-nls              \
    --disable-werror           \
    --with-lib-path=/tools/lib \
    --with-sysroot

## Compile the package:
make

## Install the package:
make install

## Now prepare the linker for the “Re-adjusting” phase in the next chapter:
make -C ld clean
make -C ld LIB_PATH=/usr/lib:/lib
cp -v ld/ld-new /tools/bin

cd $LFS && rm -rf binutils-2.29
