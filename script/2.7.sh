#!/bin/bash
# 2.7. Mounting the New Partition 

## Create the mount point and mount the LFS file system by running:
mkdir -pv $LFS && mount -v -t ext3 /dev/sdb2 $LFS
mkdir -pv $LFS/home && mount -v -t ext3 /dev/sdb3 $LFS/home
mkdir -pv $LFS/boot && mount -v -t ext2 /dev/sdb1 $LFS/boot

mkdir -pv $LFS/opt && mount -v -t ext3 /dev/sdb6 $LFS/opt
mkdir -pv $LFS/tmp && mount -v -t ext3 /dev/sdb8 $LFS/tmp
mkdir -pv $LFS/usr && mount -v -t ext3 /dev/sdb7 $LFS/usr
mkdir -pv $LFS/usr/src && mount -v -t ext4 /dev/sdb5 $LFS/usr/src

echo "/dev/sdb2     /mnt/lfs            ext3    defaults            0     1" >> /etc/fstab
echo "/dev/sdb6     /mnt/lfs/opt        ext3    defaults            0     1" >> /etc/fstab
echo "/dev/sdb8     /mnt/lfs/tmp        ext3    defaults            0     1" >> /etc/fstab
echo "/dev/sdb7     /mnt/lfs/usr        ext3    defaults            0     1" >> /etc/fstab
echo "/dev/sdb5     /mnt/lfs/usr/src    ext4    defaults            0     1" >> /etc/fstab
