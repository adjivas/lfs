#!/bin/bash
# 5.25. Grep-3.1 
cd $LFS/sources
tar -xf grep-3.1.tar.xz && cd grep-3.1

## Prepare Grep for compilation: 
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf grep-3.1
