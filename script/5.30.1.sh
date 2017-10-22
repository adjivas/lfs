#!/bin/bash
# 5.30.1. Installation of Perl
cd $LFS/sources
tar -xf perl-5.26.0.tar.xz && cd perl-5.26.0

## First, fix a build issue that arises only in the LFS environment:
sed -e '9751 a#ifndef PERL_IN_XSUB_RE' \
    -e '9808 a#endif'                  \
    -i regexec.c

## Prepare Perl for compilation:
sh Configure -des -Dprefix=/tools -Dlibs=-lm

## Build the package:
make

## Only a few of the utilities and libraries need to be installed at this time:
cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.26.0
cp -Rv lib/* /tools/lib/perl5/5.26.0

cd $LFS/sources && rm -rf perl-5.26.0
