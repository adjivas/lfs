# 5.13.1. Installation of DejaGNU
cd $LFS/sources
tar -xf dejagnu-1.6.tar.gz && cd dejagnu-1.6

## Prepare DejaGNU for compilation: 
./configure --prefix=/tools

## Build and install the package:
make install

cd $LFS/sources && rm -rf dejagnu-1.6
