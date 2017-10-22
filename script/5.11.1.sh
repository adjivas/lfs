#!/bin/bash
# 5.11.1. Installation of Tcl-core 
cd $LFS/sources
tar -xf tcl-core8.6.7-src.tar.gz && cd tcl-8.6.7

## Prepare Tcl for compilation:
cd unix
./configure --prefix=/tools

## Build the package:
make

## To run the Tcl test suite anyway, issue the following command:
TZ=UTC make test

## Install the package:
make install

## Make the installed library writable so debugging symbols can be removed later:
chmod -v u+w /tools/lib/libtcl8.6.so

## Install Tcl's headers. The next package, Expect, requires them to build.
make install-private-headers

## Now make a necessary symbolic link:
ln -sv tclsh8.6 /tools/bin/tclsh

cd $LFS/sources && rm -rf tclsh8.6.7
