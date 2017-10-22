# 5.20.1. Installation of Diffutils 
cd $LFS/sources
tar -xf diffutils-3.6.tar.xz && cd diffutils-3.6

## Prepare Diffutils for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf diffutils-3.6
