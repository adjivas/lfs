# 5.15.1. Installation of Ncurses 
cd $LFS/sources
tar -xf ncurses-6.0.tar.gz && cd ncurses-6.0

## First, ensure that gawk is found first during configuration:
sed -i s/mawk// configure

## Prepare Ncurses for compilation:
./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf ncurses-6.0
