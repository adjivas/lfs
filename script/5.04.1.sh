#!/bin/bash
# 5.4.1. Installation of Cross Binutils 
cd $LFS/sources
tar -xf binutils-2.29.tar.bz2 && cd binutils-2.29

## The Binutils documentation recommends building Binutils in a dedicated build directory: 
mkdir -v build
cd       build

## Now prepare Binutils for compilation:
../configure --prefix=/tools   \
    --with-sysroot=$LFS        \
    --with-lib-path=/tools/lib \
    --target=$LFS_TGT          \
    --disable-nls              \
    --disable-werror

# Continue with compiling the package:
make

# If building on x86_64, create a symlink to ensure the sanity of the toolchain:
case $(uname -m) in
    x86_64) mkdir -v /tools/lib && ln -sv lib /tools/lib64 ;;
esac

# Install the package:
make install

cd $LFS/sources/binutils-2.29 && rm -rf build
