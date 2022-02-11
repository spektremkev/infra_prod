sudo su
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* 
sudo dnf install centos-release-stream -y 
sudo dnf swap centos-{linux,stream}-repos -y 
sudo dnf distro-sync -y
sudo yum install mysql-server -y
systemctl start mysqld
sudo systemctl status mysqld





