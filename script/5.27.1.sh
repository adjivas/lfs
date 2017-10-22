# 5.27.1. Installation of M4 
cd $LFS/sources
tar -xf m4-1.4.18.tar.xz && cd m4-1.4.18

## Prepare M4 for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf m4-1.4.18 
