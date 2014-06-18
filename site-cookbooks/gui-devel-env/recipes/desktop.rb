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

execute "service messagebus start"
execute "service haldaemon start"

