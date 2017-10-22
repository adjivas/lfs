# 6.9.2. Configuring Glibc 

## 6.9.2.1. Adding nsswitch.conf 

### Create a new file /etc/nsswitch.conf by running the following:

cat > /etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

## 6.9.2.2. Adding time zone data

### Install and set up the time zone data with the following:
tar -xf ../../tzdata2017b.tar.gz

ZONEINFO=/usr/share/zoneinfo
mkdir -pv $ZONEINFO/{posix,right}

for tz in etcetera southamerica northamerica europe africa antarctica  \
    asia australasia backward pacificnew systemv; do
    zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz}
    zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz}
    zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz}
done
cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
zic -d $ZONEINFO -p America/New_York
unset ZONEINFO

### One way to determine the local time zone is to run the following script:
tzselect

### Then create the /etc/localtime file by running:
cp -v /usr/share/zoneinfo/<xxx> /etc/localtime

## 6.9.2.3. Configuring the Dynamic Loader 
### Create a new file /etc/ld.so.conf by running the following:
cat > /etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib

EOF

### To add this capability run the following commands:
cat >> /etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf

EOF
mkdir -pv /etc/ld.so.conf.d
