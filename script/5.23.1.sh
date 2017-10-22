# 5.23.1. Installation of Gawk
cd $LFS/sources
tar -xf gawk-4.1.4.tar.xz && cd gawk-4.1.4

## Prepare Gawk for compilation:
./configure --prefix=/tools

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf gawk-4.1.4
