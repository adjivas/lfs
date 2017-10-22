#!/bin/bash
#  5.33.1. Installation of Texinfo 
cd $LFS/sources
tar -xf texinfo-6.4.tar.xz && cd texinfo-6.4

## Prepare Texinfo for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf texinfo-6.4
