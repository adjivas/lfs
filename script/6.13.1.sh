# 6.13.1. Installation of Readline 

## Reinstalling Readline will cause the old libraries to be moved to <libraryname>.old. While this is normally not a problem, in some cases it can trigger a linking bug in ldconfig. This can be avoided by issuing the following two seds:
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install

## Prepare Readline for compilation:
./configure --prefix=/usr    \
    --disable-static \
    --docdir=/usr/share/doc/readline-7.0

## Compile the package:
make SHLIB_LIBS="-L/tools/lib -lncursesw"

## Install the package:
make SHLIB_LIBS="-L/tools/lib -lncurses" install

## Now move the dynamic libraries to a more appropriate location and fix up some symbolic links:
mv -v /usr/lib/lib{readline,history}.so.* /lib
ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so
ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so ) /usr/lib/libhistory.so

## If desired, install the documentation:
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-7.0
