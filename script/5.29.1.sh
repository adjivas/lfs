# 5.29.1. Installation of Patch 
cd $LFS/sources
tar -xf patch-2.7.5.tar.xz && cd patch-2.7.5

## Prepare Patch for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf patch-2.7.5
