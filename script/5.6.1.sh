# 5.6.1. Installation of Linux API Headers 
cd $LFS/sources
tar -xf linux-4.12.7.tar.xz && cd linux-4.12.7

# Make sure there are no stale files embedded in the package:
make mrproper

# Now extract the user-visible kernel headers from the source. They are placed in an intermediate local directory and copied to the needed location because the extraction process removes any existing files in the target directory. 
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* /tools/include

cd $LFS/sources && rm -rf linux-4.12.7
