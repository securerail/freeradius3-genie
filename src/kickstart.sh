#!/bin/bash
sudo apt-get update --yes
sudo apt-get upgrade --yes
sudo apt-get install --yes php-cli php-mbstring php-mysql unzip
sudo apt-get install --yes mariadb-server mariadb-client
sudo apt-get install --yes freeradius freeradius-common freeradius-utils freeradius-mysql

/usr/bin/fallocate -l 4G /swapfile
/bin/chmod 600 /swapfile
/sbin/mkswap /swapfile
/sbin/swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab
/sbin/sysctl vm.swappiness=10
echo 'vm.swappiness=10' >> /etc/sysctl.conf
/sbin/sysctl vm.vfs_cache_pressure=50
echo 'vm.vfs_cache_pressure=50' >> /etc/sysctl.c

sudo /usr/bin/mysql_secure_installation
