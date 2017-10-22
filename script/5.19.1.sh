#!/bin/bash
# 5.19.1. Installation of Coreutils 
cd $LFS/sources
tar -xf coreutils-8.27.tar.xz && cd coreutils-8.27

## Prepare Coreutils for compilation:
./configure --prefix=/tools --enable-install-program=hostname

## Compile the package:
make
  
## Install the package:
make install

cd $LFS/sources && rm -rf coreutils-8.27
