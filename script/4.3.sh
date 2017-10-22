# 4.3. Adding the LFS User 

## You could use your own user name, but to make it easier to set up a clean working environment, create a new user called lfs as a member of a new group (also named lfs) and use this user during the installation process. As root, issue the following commands to add the new user:
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

## To log in as lfs (as opposed to switching to user lfs when logged in as root, which does not require the lfs user to have a password), give lfs a password:
passwd lfs

## Grant lfs full access to $LFS/tools by making lfs the directory owner:
chown -v lfs $LFS/tools

## If a separate working directory was created as suggested, give user lfs ownership of this directory:
chown -v lfs $LFS/sources

## Next, login as user lfs. This can be done via a virtual console, through a display manager, or with the following substitute user command:
su - lfs
