# 6.4. Entering the Chroot Environment 

## As user root, run the following command to enter the realm that is, at the moment, populated with only the temporary tools: 
chroot "$LFS" /tools/bin/env -i \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='\u:\w\$ '              \
    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin \
    /tools/bin/bash --login +h
