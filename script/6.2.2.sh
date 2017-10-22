# 6.2.2. Mounting and Populating /dev 

## A bind mount is a special type of mount that allows you to create a mirror of a directory or mount point to some other location. Use the following command to achieve this: 
mount -v --bind /dev $LFS/dev
