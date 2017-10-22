# 5.35.1. Installation of Xz
cd $LFS/sources
tar -xf xz-5.2.3.tar.xz && cd xz-5.2.3

## Prepare Xz for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf xz-5.2.3
