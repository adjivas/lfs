#!/bin/bash
# 5.28.1. Installation of Make 
cd $LFS/sources
tar -xf make-4.2.1.tar.bz2 && cd make-4.2.1

## Prepare Make for compilation:
./configure --prefix=/tools --without-guile

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf make-4.2.1
