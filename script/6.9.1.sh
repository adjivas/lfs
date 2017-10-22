# 6.9.1. Installation of Glibc 

## Apply the following patch to make such programs store their runtime data in the FHS-compliant locations:
patch -Np1 -i ../glibc-2.26-fhs-1.patch

## First create a compatibility symlink to avoid references to /tools in our final glibc:
ln -sfv /tools/lib/gcc /usr/lib

## Determine the GCC include directory and create a symlink for LSB compliance. Additionally, for x86_64, create a compatibility symlink required for the dynamic loader to function correctly:
case $(uname -m) in
    i?86)    GCC_INCDIR=/usr/lib/gcc/$(uname -m)-pc-linux-gnu/7.2.0/include
        ln -sfv ld-linux.so.2 /lib/ld-lsb.so.3
        ;;
    x86_64) GCC_INCDIR=/usr/lib/gcc/x86_64-pc-linux-gnu/7.2.0/include
        ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64
        ln -sfv ../lib/ld-linux-x86-64.so.2 /lib64/ld-lsb-x86-64.so.3
        ;;
esac

## Remove a file that may be left over from a previous build attempt:
rm -f /usr/include/limits.h

## The Glibc documentation recommends building Glibc in a dedicated build directory:
mkdir -v build
cd       build

## Prepare Glibc for compilation:
CC="gcc -isystem $GCC_INCDIR -isystem /usr/include" \
    ../configure --prefix=/usr                          \
    --disable-werror                       \
    --enable-kernel=3.2                    \
    --enable-stack-protector=strong        \
    libc_cv_slibdir=/lib
unset GCC_INCDIR

## Compile the package:
make

## Generally a few tests do not pass, but you can generally ignore any of the test failures listed below. Now test the build results:
make check

## Though it is a harmless message, the install stage of Glibc will complain about the absence of /etc/ld.so.conf. Prevent this warning with:
touch /etc/ld.so.conf

## Fix the generated Makefile to skip an uneeded sanity check that fails in the LFS partial environment:
sed '/test-installation/s@$(PERL)@echo not running@' -i ../Makefile

## Install the package:
make install

## Install the configuration file and runtime directory for nscd:
cp -v ../nscd/nscd.conf /etc/nscd.conf
mkdir -pv /var/cache/nscd

## The following instructions will install the minimum set of locales necessary for the optimal coverage of tests:
mkdir -pv /usr/lib/locale
localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 de_DE
localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i en_GB -f UTF-8 en_GB.UTF-8
localedef -i en_HK -f ISO-8859-1 en_HK
localedef -i en_PH -f ISO-8859-1 en_PH
localedef -i en_US -f ISO-8859-1 en_US
localedef -i en_US -f UTF-8 en_US.UTF-8
localedef -i es_MX -f ISO-8859-1 es_MX
localedef -i fa_IR -f UTF-8 fa_IR
localedef -i fr_FR -f ISO-8859-1 fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
localedef -i it_IT -f ISO-8859-1 it_IT
localedef -i it_IT -f UTF-8 it_IT.UTF-8
localedef -i ja_JP -f EUC-JP ja_JP
localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
localedef -i zh_CN -f GB18030 zh_CN.GB18030

## Alternatively, install all locales listed in the glibc-2.26/localedata/SUPPORTED file (it includes every locale listed above and many more) at once with the following time-consuming command:
make localedata/install-locales
