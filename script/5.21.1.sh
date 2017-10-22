# 5.21.1. Installation of File 
cd $LFS/sources
tar -xf file-5.31.tar.gz && cd file-5.31

## Prepare File for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf file-5.31
