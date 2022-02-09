$script_mysql = <<-SCRIPT
    yum update && \
    yum install -y mysql-server-5.7 && \
    mysql -e "create user 'phpuser'@'%' identified by 'pass';"
SCRIPT

$script_update = <<-SCRIPT
  sudo su && \
  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* && \
  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* && \ 
  sudo dnf install centos-release-stream -y && \ 
  sudo dnf swap centos-{linux,stream}-repos -y && \
  sudo dnf distro-sync -y && \
  dnf update -y && \

SCRIPT

Vagrant.configure("2") do |configc|

  configc.vm.box = "centos/8"
  
#==============================Host================================================
configc.vm.define "hostc" do |hostc|

 hostc.vm.provision "shell", inline: $script_update

  hostc.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "hostc"
      
  end
end  
#==============================Proxys================================================
configc.vm.define "squid3c" do |squid3c|
  #nginxc.vm.provision "shell", inline: "yum update && dnf install nginx -y"   

  squid3c.vm.network "forwarded_port", guest: 80, host:8089
  #squid3c.vm.network "public_network" , ip: "192.168.1.21"
  squid3c.vm.network "private_network", ip: "192.168.1.21"

  squid3c.vm.provision "shell", inline: $script_update

  squid3c.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "squid3c"
        
    end
end    

configc.vm.define "nginxc" do |nginxc|
    #nginxc.vm.provision "shell", inline: "yum update && dnf install nginx -y"   

    nginxc.vm.network "forwarded_port", guest: 80, host:8080
    nginxc.vm.network "public_network" , ip: "192.168.1.24"
    #nginxc.vm.network "private_network", ip: "192.168.50.4"


    nginxc.vm.provision "shell", inline: $script_update

    nginxc.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "nginxc"
        
    end
end    
                        
#==============================Cluster================================================
      configc.vm.define "mysqldb1c" do |mysqldb1c|
        mysqldb1.vm.network "forwarded_port", guest: 80, host:8081
        
        mysqldb2c.vm.provision "shell",  inline: $script_update
        mysqldb1c.vm.provision "shell",  inline: $script_mysql
        mysqldb1c.vm.provision "shell",  inline: "service mysql restart"

        mysqldb1c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb1c"
          end 
      end
      
      configc.vm.define "mysqldb2c" do |mysqldb2c|
        mysqldb2.vm.network "forwarded_port", guest: 80, host:8082

        mysqldb2c.vm.provision "shell",  inline: $script_update
        mysqldb2c.vm.provision "shell", inline: $script_mysql
        mysqldb2c.vm.provision "shell", inline: "service mysql restart"

        mysqldb2c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb2c"
          end 
      end


    configc.vm.define "mysqldb3c" do |mysqldb3c|
      mysqldb3.vm.network "forwarded_port", guest: 80, host:8083

      
      mysqldb3c.vm.provision "shell", inline: $script_update

      mysqldb3c.vm.provision "shell", inline: $script_mysql
      mysqldb3c.vm.provision "shell", inline: "service mysql restart"

        mysqldb3c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb3c"
          end 
    end
  


#==============================================================================

configc.vm.define "dockerhostc" do |dockerhostc|

 #dockerhostc.vm.provision "shell", 
 # inline: "yum update "   
  dockerhostc.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "centos_dockerhostc"
      
  end
end




#=================================FIM============================================= 

end