#!/bin/bash
# 3.1. Introduction 

## To create this directory, execute the following command, as user root, before starting the download session:
mkdir -v $LFS/sources

## Make this directory writable and sticky. “Sticky” means that even if multiple users have write permission on a directory, only the owner of a file can delete the file within a sticky directory. The following command will enable the write and sticky modes:
chmod -v a+wt $LFS/sources

## An easy way to download all of the packages and patches is by using wget-list as an input to wget. For example:
wget --input-file=$HOME/lfs/extra/wget-list --continue --directory-prefix=$LFS/sources

## Additionally, starting with LFS-7.0, there is a separate file, md5sums, which can be used to verify that all the correct packages are available before proceeding. Place that file in $LFS/sources and run:
pushd $LFS/sources
md5sum -c $HOME/lfs/extra/md5sums
popd
