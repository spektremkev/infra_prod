sudo su 
systemctl start mysqld.service
systemctl status mysqld
mysql -u root -p
bL29V1!2@93
set global super_read_only=0;
exit
mysqlsh
\c vagrant@192.168.50.3 
bL29V1!2@94
dba.configureInstance('vagrant@192.168.50.3:3306');
bL29V1!2@94
dba.dropMetadataSchema()
cluster = dba.createCluster('vagranttest');
