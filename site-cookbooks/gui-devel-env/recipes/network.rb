# config network

# first, service network 'enable'
service "network" do
  supports :restart => true
  action :enable
end

template "/etc/sysconfig/network" do  source "/etc/sysconfig/network"
  owner "root"
  group "root"
  mode 0600
  notifies :restart, 'service[network]'
end

template "/etc/hosts" do  source "/etc/hosts"
  owner "root"
  group "root"
  mode 0600
end

template "/etc/hosts.allow" do  source "/etc/hosts.allow"
  owner "root"
  group "root"
  mode 0600
end

template "/etc/hosts.deny" do  source "/etc/hosts.deny"
  owner "root"
  group "root"
  mode 0600
end

template "/etc/sysconfig/i18n" do  source "/etc/sysconfig/i18n"
  owner "root"
  group "root"
  mode 0644
end

