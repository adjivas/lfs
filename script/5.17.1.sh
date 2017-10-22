# 5.17.1. Installation of Bison 
cd $LFS/sources
tar -xf bison-3.0.4.tar.xz && cd bison-3.0.4

## Prepare Bison for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf bison-3.0.4
