#!/bin/bash
# 5.12.1. Installation of Expect 
cd $LFS/sources
tar -xf expect5.45.tar.gz && cd expect5.45

## This will ensure that our test suite tools remain sane for the final builds of our toolchain:
cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

## Now prepare Expect for compilation:
./configure --prefix=/tools       \
    --with-tcl=/tools/lib \
    --with-tclinclude=/tools/include

## Build the package:
make

## Install the package:
make SCRIPTS="" install

cd $LFS/sources && rm -rf expect5.45
