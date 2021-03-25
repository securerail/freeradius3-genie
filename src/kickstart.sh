#!/bin/bash
sudo apt-get update --yes
sudo apt-get upgrade --yes
sudo apt-get install --yes php-cli php-mbstring php-mysql unzip
sudo apt-get install --yes mariadb-server mariadb-client
#sudo apt-get install --yes freeradius freeradius-common freeradius-utils freeradius-mysql
sudo apt-get install --yes freeradius=2.2.10
sudo apt-get install --yes freeradius-mysql=2.2.10


/usr/bin/fallocate -l 4G /swapfile
/bin/chmod 600 /swapfile
/sbin/mkswap /swapfile
/sbin/swapon /swapfile
echo '/swapfile none swap sw 0 0' >> /etc/fstab
/sbin/sysctl vm.swappiness=10
echo 'vm.swappiness=10' >> /etc/sysctl.conf
/sbin/sysctl vm.vfs_cache_pressure=50
echo 'vm.vfs_cache_pressure=50' >> /etc/sysctl.c
echo '# PUT YOUR MYSQL PASSWORD YOU JUST ENTERED BELOW, THEN PRESS CTRL+X and Y to SAVE CHANGES' >> ~/freeradius3-genie/.env
echo 'MYSQL_PASSWORD=changeme' >> ~/freeradius3-genie/.env
sudo /usr/bin/mysql_secure_installation
nano ~/freeradius3-genie/.env
