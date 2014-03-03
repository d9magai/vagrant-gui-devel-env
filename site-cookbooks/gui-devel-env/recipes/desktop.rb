# install desktop environment
execute "yum -y groupinstall x11"
execute "yum -y groupinstall fonts"
execute "yum -y groupinstall basic-desktop"
execute "yum -y groupinstall desktop-platform"
execute "yum -y groupinstall \"Japanese Support\""
execute "yum -y install glibc"

execute "service messagebus start"
execute "service haldaemon start"

