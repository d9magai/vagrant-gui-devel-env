# install gui environment
[
"x11",
"fonts",
"basic-desktop",
"desktop-platform",
"\"JapaneseSupport\"",
].each do |group|
  execute "yum -y groupinstall #{group}"
end

%w{
messagebus
haldaemon
firstboot
}.each do |service_name|
  service service_name do
    action   [ :enable, :start ]
  end
end

template "/etc/inittab" do
  owner "root"
  group "root"
  mode 0644
end

