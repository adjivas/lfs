#!/bin/bash
# 5.14.1. Installation of Check
cd $LFS/sources
tar -xf check-0.11.0.tar.gz && cd check-0.11.0

## Prepare Check for compilation:
PKG_CONFIG= ./configure --prefix=/tools

## Build the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf check-0.11.0
