# 6.7.1. Installation of Linux API Headers

## Make sure there are no stale files and dependencies lying around from previous activity:
make mrproper

## There are also some hidden files used by the kernel developers and not needed by LFS that are removed from the intermediate directory.
make INSTALL_HDR_PATH=dest headers_install
find dest/include \( -name .install -o -name ..install.cmd \) -delete
cp -rv dest/include/* /usr/include
