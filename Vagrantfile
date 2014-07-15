Vagrant.configure("2") do |config|
   config.vm.box = "centos6.5"

   config.vm.provider :virtualbox do |vb|
     vb.gui = true
     vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "4", "--ioapic", "on"]
   end


   config.vm.provision :chef_solo do |chef|
     chef.cookbooks_path = [ "./cookbooks", "./site-cookbooks" ]
     chef.roles_path = "./roles"
     chef.add_role  "guidevenv"

   end

end

