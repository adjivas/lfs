# 5.7.1. Installation of Glibc 
cd $LFS/sources
tar -xf glibc-2.26.tar.xz && cd glibc-2.26

## The Glibc documentation recommends building Glibc in a dedicated build directory:
mkdir -v build
cd build

## Next, prepare Glibc for compilation:
../configure                           \
    --prefix=/tools                    \
    --host=$LFS_TGT                    \
    --build=$(../scripts/config.guess) \
    --enable-kernel=3.2                \
    --with-headers=/tools/include      \
    libc_cv_forced_unwind=yes          \
    libc_cv_c_cleanup=yes

## Compile the package:
make -j1

## Install the package:
make install

## To perform a sanity check, run the following commands: 
## [Requesting program interpreter: /tools/lib/ld-linux.so.2]
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep ': /tools'

cd $LFS/sources && rm -rf glibc-2.26
