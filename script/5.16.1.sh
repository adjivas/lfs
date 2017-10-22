# 5.16.1 Bash-4.4 
cd $LFS/sources
tar -xf bash-4.4.tar.gz && cd bash-4.4

## Prepare Bash for compilation:
./configure --prefix=/tools --without-bash-malloc

## Compile the package:
make

## Install the package:
make install

## Make a link for the programs that use sh for a shell:
ln -sv bash /tools/bin/sh

cd $LFS/sources && rm -rf bash-4.4
