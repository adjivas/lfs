# 6.2.1. Creating Initial Device Nodes

## The device nodes must be created on the hard disk so that they are available before udevd has been started, and additionally when Linux is started with init=/bin/bash. Create the devices by running the following commands:
mknod -m 600 $LFS/dev/console c 5 1
mknod -m 666 $LFS/dev/null c 1 3
