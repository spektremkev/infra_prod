sudo su
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* 
sudo dnf install centos-release-stream -y 
sudo dnf swap centos-{linux,stream}-repos -y 
sudo dnf distro-sync -y
rpm -ivh https://yum.puppetlabs.com/el/7/products/x86_64/puppetlabs-release-7-11.noarch.rpm
yum install -y puppet-server
yum install -y puppet-agent
yum install vim-enhanced -y
yum install mysql -y
sudo yum -y install ansible
sudo yum install mysql-server -y
systemctl start mysqld
sudo systemctl status mysqld