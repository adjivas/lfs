#!/bin/bash
# 5.31.1. Installation of Sed
cd $LFS/sources
tar -xf sed-4.4.tar.xz && cd sed-4.4

## Prepare Sed for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf sed-4.4
