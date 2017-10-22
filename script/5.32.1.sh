# 5.32.1. Installation of Tar 
cd $LFS/sources
tar -xf tar-1.29.tar.xz && cd tar-1.29

## Prepare Tar for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf tar-1.29
