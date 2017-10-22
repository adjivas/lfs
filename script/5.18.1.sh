#!/bin/bash
# 5.18.1. Installation of Bzip2
cd $LFS/sources
tar -xf bzip2-1.0.6.tar.gz && cd bzip2-1.0.6

## Compile and test it with:
make

## Install the package:
make PREFIX=/tools install

cd $LFS/sources && rm -rf bzip2-1.0.6
