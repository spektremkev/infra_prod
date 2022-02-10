

#mysql -e "create user 'phpuser'@'%' identified by 'pass';"

Vagrant.configure("2") do |configc|

  configc.vm.box = "centos/8"
  
#==============================Host================================================
configc.vm.define "hostc" do |hostc|

 hostc.vm.provision "shell", path: "hostc.sh"

  hostc.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "hostc"
      
  end
end  
#==============================Proxys================================================
configc.vm.define "squid3c" do |squid3c|
     
  squid3c.vm.network "forwarded_port", guest: 80, host:8089
  squid3c.vm.network "private_network", ip: "192.168.1.21"

  squid3c.vm.provision "shell", path: "squid3c.sh"
  squid3c.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "squid3c"
        
    end
end    

configc.vm.define "nginxc" do |nginxc|
     

    nginxc.vm.network "forwarded_port", guest: 80, host:8080
    #nginxc.vm.network "public_network" , ip: "192.168.1.24"
    nginxc.vm.network "private_network", ip: "192.168.50.4"

    nginxc.vm.provision "shell", path: "nginxc.sh"

    nginxc.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "nginxc"
        
    end
end    
                        
#==============================Cluster================================================
      configc.vm.define "mysqldb1c" do |mysqldb1c|
        mysqldb1c.vm.network "forwarded_port", guest: 80, host:8081
        
        mysqldb1c.vm.provision "shell", path: "mysqldbc.sh"

        mysqldb1c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb1c"
          end 
      end
      
      configc.vm.define "mysqldb2c" do |mysqldb2c|
        mysqldb2c.vm.network "forwarded_port", guest: 80, host:8082

        mysqldb2c.vm.provision "shell", path: "mysqldbc.sh"

       # mysqldb2c.vm.provision "shell", inline: $script_mysql
       # mysqldb2c.vm.provision "shell", inline: "service mysql restart"

        mysqldb2c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb2c"
          end 
      end


    configc.vm.define "mysqldb3c" do |mysqldb3c|
      mysqldb3c.vm.network "forwarded_port", guest: 80, host:8083

      
      mysqldb3c.vm.provision "shell", path: "mysqldbc.sh"

     # mysqldb3c.vm.provision "shell", inline: $script_mysql
     # mysqldb3c.vm.provision "shell", inline: "service mysql restart"

        mysqldb3c.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb3c"
          end 
    end
  


#==============================================================================

configc.vm.define "dockerhostc" do |dockerhostc|

  dockerhostc.vm.network "forwarded_port", guest: 80, host:8085

 dockerhostc.vm.provision "shell", path: "dockerhostc.sh"
  dockerhostc.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "dockerhostc"
      
  end
end




#=================================FIM============================================= 

end