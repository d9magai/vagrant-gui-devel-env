# install desktop environment
execute "yum -y groupinstall x11 fonts basic-desktop desktop-platform \"Japanese Support\""
execute "yum -y install glibc"

execute "service messagebus start"
execute "service haldaemon start"

