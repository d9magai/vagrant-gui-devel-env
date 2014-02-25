Vagrant.configure("2") do |config|
   config.vm.box = "centos6.4"
   config.omnibus.chef_version = :latest

   config.vm.provider :virtualbox do |vb|
     vb.gui = true
     vb.customize ["modifyvm", :id, "--memory", "2048"]
   end


   config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = [ "./cookbooks", "./site-cookbooks" ]
     chef.roles_path = "./roles"
     chef.add_role  "guidevenv"

   end

end

