# 5.22.1. Installation of Findutils
cd $LFS/sources
tar -xf findutils-4.6.0.tar.gz && cd findutils-4.6.0

## Prepare Findutils for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf findutils-4.6.0
