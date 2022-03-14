sudo su 
systemctl start mysqld.service
systemctl status mysqld
mysql -u root -p
bL29V1!2@93
set global super_read_only=0;
exit
mysqlsh
\c vagrant@192.168.50.2 
dba.configureInstance('vagrant@192.168.50.2:3306');
dba.dropMetadataSchema()
cluster = dba.createCluster('vagranttest');
cluster.addInstance('vagrant@192.168.50.3');
bL29V1!2@94


bL29V1!2@93


n211d032633
n211d032628
n211d032632
n211d032630
n211d032629
n211d032631
n211d031888