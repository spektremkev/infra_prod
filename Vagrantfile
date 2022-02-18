
Vagrant.configure("2") do |configc|

  configc.vm.box = "centos/8"
  
#==============================Host================================================
configc.vm.define "hostc" do |hostc|

 hostc.vm.provision "shell", path: "hostc.sh"
 hostc.vm.network "private_network", ip: "192.168.50.8"
  hostc.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "hostc"
      
  end
end 

configc.vm.define "mysqlclientc" do |mysqlclientc|
     

  mysqlclientc.vm.network "forwarded_port", guest: 80, host:8082
 #mysqlclientc.vm.network "forwarded_port", guest: 5432, host: 6549
  #mysqlclientc.vm.network "public_network" 
  mysqlclientc.vm.network "private_network", ip: "192.168.50.9"

  mysqlclientc.vm.provision "shell", path: "mysqlclientc.sh"

  mysqlclientc.vm.provider "virtualbox" do |vb|
      vb.memory = 512
      vb.cpus = 1
      vb.name = "mysqlclientc"
      
  end
end   

#==============================Proxys================================================
configc.vm.define "squid3c" do |squid3c|
     
  squid3c.vm.network "forwarded_port", guest: 80, host:8089
  squid3c.vm.network "private_network", ip: "192.168.50.7"

  squid3c.vm.provision "shell", path: "squid3c.sh"
  squid3c.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "squid3c"
        
    end
end    

configc.vm.define "nginxc" do |nginxc|
     

    nginxc.vm.network "forwarded_port", guest: 80, host:8080
    nginxc.vm.network "forwarded_port", guest: 5432, host: 6543
    #nginxc.vm.network "public_network" 
    nginxc.vm.network "private_network", ip: "192.168.50.6"

    nginxc.vm.provision "shell", path: "nginxc.sh"

    nginxc.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "nginxc"
        
    end
end    

configc.vm.define "mysqlrouter" do |mysqlrouter|
     

  mysqlrouter.vm.network "forwarded_port", guest: 80, host:8080
  #mysqlrouter.vm.network "public_network" , ip: "192.168.1.24"
  mysqlrouter.vm.network "private_network", ip: "192.168.50.1"

  mysqlrouter.vm.provision "shell", path: "nginxc.sh"

  mysqlrouter.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "nginxc"
      
  end
end       
#==============================Cluster================================================
      configc.vm.define "mysqldb1c" do |mysqldb1c|
        
        mysqldb1c.vm.network "forwarded_port", guest: 80, host:8081

        mysqldb1c.vm.network "private_network", ip: "192.168.50.2"
        mysqldb1c.vm.provision "shell", path: "mysqldbc.sh"
        

        mysqldb1c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb1c"
          end 
      end
      
      configc.vm.define "mysqldb2c" do |mysqldb2c|
        mysqldb2c.vm.network "forwarded_port", guest: 80, host:8088
        mysqldb2c.vm.network "private_network", ip: "192.168.50.3"
        mysqldb2c.vm.provision "shell", path: "mysqldbc.sh"

        mysqldb2c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb2c"
          end 
      end

    configc.vm.define "mysqldb3c" do |mysqldb3c|
      mysqldb3c.vm.network "forwarded_port", guest: 80, host:8087
      mysqldb3c.vm.network "private_network", ip: "192.168.50.4"
      
      mysqldb3c.vm.provision "shell", path: "mysqldbc.sh"

     # mysqldb3c.vm.provision "shell", inline: $script_mysql
     # mysqldb3c.vm.provision "shell", inline: "service mysql restart"

        mysqldb3c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb3c"
          end 
    end
#===============================Dcoker================================================

configc.vm.define "dockerhostc" do |dockerhostc|

  dockerhostc.vm.network "forwarded_port", guest: 80, host:8085
  dockerhostc.vm.network "private_network", ip: "192.168.50.5"
 dockerhostc.vm.provision "shell", path: "dockerhostc.sh"
  dockerhostc.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "dockerhostc"
      
  end
end

#=================================FIM============================================= 
end