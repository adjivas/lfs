#!/bin/bash
# 5.26.1. Installation of Gzip 
cd $LFS/sources
tar -xf gzip-1.8.tar.xz && cd gzip-1.8

## Prepare Gzip for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf gzip-1.8 
