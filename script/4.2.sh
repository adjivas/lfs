#!/bin/bash
# 4.2. Creating the $LFS/tools Directory 

## Create the required directory by running the following as root:
mkdir -v $LFS/tools

## The next step is to create a /tools symlink on the host system. This will point to the newly-created directory on the LFS partition. Run this command as root as well:
ln -sv $LFS/tools /
