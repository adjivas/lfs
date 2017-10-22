# 5.34.1. Installation of Util-linux
cd $LFS/sources
tar -xf util-linux-2.30.1.tar.xz && cd util-linux-2.30.1

## Prepare Util-linux for compilation:
./configure --prefix=/tools        \
    --without-python               \
    --disable-makeinstall-chown    \
    --without-systemdsystemunitdir \
    --without-ncurses              \
    PKG_CONFIG=""

## Compile the package:
make

## Install the package:
make install

cd $LFS/sources && rm -rf texinfo-6.4
