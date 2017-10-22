# 5.10.1. Installation of GCC 
cd $LFS/sources/gcc-7.2.0

## Create a full version of the internal header using a command that is identical to what the GCC build system does in normal circumstances:
cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
    `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h

## Once again, change the location of GCC's default dynamic linker to use the one installed in /tools.
for file in gcc/config/{linux,i386/linux{,64}}.h
do
    cp -uv $file{,.orig}
    sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
        -e 's@/usr@/tools@g' $file.orig > $file
    echo '
    #undef STANDARD_STARTFILE_PREFIX_1
    #undef STANDARD_STARTFILE_PREFIX_2
    #define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
    #define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
    touch $file.orig
done

## If building on x86_64, change the default directory name for 64-bit libraries to “lib”:
case $(uname -m) in
    x86_64)
        sed -e '/m64=/s/lib64/lib/' \
            -i.orig gcc/config/i386/t-linux64
        ;;
esac

## As in the first build of GCC it requires the GMP, MPFR and MPC packages. Unpack the tarballs and move them into the required directory names:
tar -xf ../mpfr-3.1.5.tar.xz
mv -v mpfr-3.1.5 mpfr
tar -xf ../gmp-6.1.2.tar.xz
mv -v gmp-6.1.2 gmp
tar -xf ../mpc-1.0.3.tar.gz
mv -v mpc-1.0.3 mpc

## Create a separate build directory again:
mkdir -v build
cd       build

## Now prepare GCC for compilation:
CC=$LFS_TGT-gcc                                    \
    CXX=$LFS_TGT-g++                               \
    AR=$LFS_TGT-ar                                 \
    RANLIB=$LFS_TGT-ranlib                         \
    ../configure                                   \
    --prefix=/tools                                \
    --with-local-prefix=/tools                     \
    --with-native-system-header-dir=/tools/include \
    --enable-languages=c,c++                       \
    --disable-libstdcxx-pch                        \
    --disable-multilib                             \
    --disable-bootstrap                            \
    --disable-libgomp

## Compile the package:
make

## Install the package:
make install

## Running cc leaves the system administrator free to decide which C compiler to install:
ln -sv gcc /tools/bin/cc

## To perform a sanity check, run the following commands: 
## [Requesting program interpreter: /tools/lib/ld-linux.so.2]
echo 'int main(){}' > dummy.c
$LFS_TGT-gcc dummy.c
readelf -l a.out | grep ': /tools'

cd $LFS/sources && rm -rf gcc-7.2.0
