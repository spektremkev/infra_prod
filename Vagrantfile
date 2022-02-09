$script_mysql = <<-SCRIPT
    apt-get  update && \
    apt install -y mysql-server-5.7 && \
    mysql -e "create user 'phpuser'@'%' identified by 'pass';"
SCRIPT


Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  #config.vm.network "private_network", ip: "192.168.50.10"

  
#==============================Host================================================
config.vm.define "hostd" do |hostd|

  hostd.vm.provision "shell", 
  inline: "apt-get update"

  hostd.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "hostd"
      
  end
end  

#==============================Proxy================================================
  config.vm.define "nginx" do |nginxd|
    nginxd.vm.provision "shell", 
      inline: "apt-get update && apt-get install nginx -y"   

    nginxd.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "nginxd"
        
    end
  end    
                        
#==============================Cluster================================================
    config.vm.define "mysqldb1d" do |mysqldb1d|
      mysqldb1d.vm.network "forwarded_port", guest: 80, host:8081
        
      mysqldb1d.vm.provision "shell", 
          inline: $script_mysql
      mysqldb1d.vm.provision "shell", 
          inline: "service mysql restart"

        mysqldb1d.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb1d"
          end 
    end
      
    config.vm.define "mysqldb2d" do |mysqldb2d|
        #mysqldb2.vm.network "forwarded_port", guest: 80, host:8082
      mysqldb2d.vm.provision "shell", 
          inline: $script_mysql
      mysqldb2d.vm.provision "shell", 
          inline: "service mysql restart"

        mysqldb2d.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb2d"
          end 
    end


    config.vm.define "mysqldb3d" do |mysqldb3d|
      # mysqldb3.vm.network "forwarded_port", guest: 80, host:8083

      mysqldb3d.vm.provision "shell", 
          inline: $script_mysql
      mysqldb3d.vm.provision "shell", 
          inline: "service mysql restart"

        mysqldb3d.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb3d"
          end 
    end
  


#==============================================================================

config.vm.define "dockerhostd" do |dockerhostd|

 # dockerhost.vm.provision "shell", inline: "yum update "   

  dockerhostd.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "ubuntu_dockerhostd"
      
  end
end




#=================================FIM============================================= 

end