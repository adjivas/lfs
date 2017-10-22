#!/bin/bash
# 5.24.1. Installation of Gettext 
cd $LFS/sources
tar -xf gettext-0.19.8.1.tar.xz && cd gettext-0.19.8.1

## Prepare Gettext for compilation:
cd gettext-tools
EMACS="no" ./configure --prefix=/tools --disable-shared

## Compile the package:
make -C gnulib-lib
make -C intl pluralx.c
make -C src msgfmt
make -C src msgmerge
make -C src xgettext

## Install the msgfmt, msgmerge and xgettext programs:
cp -v src/{msgfmt,msgmerge,xgettext} /tools/bin
