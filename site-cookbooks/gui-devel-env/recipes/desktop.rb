# install desktop environment
[
"x11",
"fonts",
"basic-desktop",
"desktop-platform",
"\"JapaneseSupport\"",
].each do |group|
  execute "yum -y groupinstall #{group}"
end

%w{messagebus haldaemon}.each do |service_name|
  service service_name do
    action   [ :enable, :start ]
  end
end

