$script_mysql = <<-SCRIPT
    yum update && \
    yum install -y mysql-server-5.7 && \
    mysql -e "create user 'phpuser'@'%' identified by 'pass';"
SCRIPT


Vagrant.configure("2") do |config|
  #config.vm.box = "ubuntu/focal64"
  config.vm.box = "centos/8"


  #config.vm.network "private_network", ip: "192.168.50.10"

  
#==============================Host================================================
config.vm.define "host" do |host|
 # host.vm.provision "shell", inline: "yum update "   
  config.ssh.username = 'root'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = 'true'

  host.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "host"
      
  end
end  
#==============================Proxy================================================
  config.vm.define "nginx" do |nginx|
    #nginx.vm.provision "shell", inline: "yum update && dnf install nginx -y"   

    nginx.vm.provider "virtualbox" do |vb|
        vb.memory = 1024
        vb.cpus = 1
        vb.name = "nginx"
        
    end
  end    
                        
#==============================Cluster================================================
      config.vm.define "mysqldb1" do |mysqldb1|
       # mysqldb1.vm.network "forwarded_port", guest: 80, host:8081
        
      # mysqldb1.vm.provision "shell", inline: $script_mysql
      # mysqldb1.vm.provision "shell", inline: "service mysql restart"

        mysqldb1.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb1"
          end 
      end
      
      config.vm.define "mysqldb2" do |mysqldb2|
        #mysqldb2.vm.network "forwarded_port", guest: 80, host:8082
      # mysqldb2.vm.provision "shell", inline: $script_mysql
      # mysqldb2.vm.provision "shell",inline: "service mysql restart"

        mysqldb2.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb2"
          end 
      end


      config.vm.define "mysqldb3" do |mysqldb3|
      # mysqldb3.vm.network "forwarded_port", guest: 80, host:8083
      # mysqldb3.vm.provision "shell", inline: $script_mysql
      # mysqldb3.vm.provision "shell",inline: "service mysql restart"

        mysqldb3.vm.provider "virtualbox" do |vb|
          vb.memory = 1024
          vb.cpus = 1
          vb.name = "mysqldb3"
          end 
      end
  


#==============================================================================

config.vm.define "dockerhost" do |dockerhost|

 # dockerhost.vm.provision "shell", inline: "yum update "   

  dockerhost.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.cpus = 1
      vb.name = "ubuntu_dockerhost"
      
  end
end




#=================================FIM============================================= 

end