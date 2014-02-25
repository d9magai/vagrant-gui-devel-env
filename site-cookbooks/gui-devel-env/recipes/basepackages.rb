# yum install base packages
# 
%w{gcc make nkf wget openssl-devel firefox}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "set timezone" do
  command <<-EOH
    cp /usr/share/zoneinfo/Japan /etc/localtime
  EOH
  action :run
end


# stop unnecessary deamons
# 
# see http://d.hatena.ne.jp/shogo0809/20091215/1260879331
# auditd - SELinux logger
# netfs - NFS client
%w{auditd  autofs  avahi-daemon  bluetooth  cups  firstboot
   gpm  haldaemon  hidd  isdn  ip6tables kudzu  lvm2-monitor  mcstrans 
   mdmonitor  messagebus  netfs  nfslock  pcscd  portmap
   rawdevices  restorecond  rpcgssd  rpcidmapd  smartd  xfs
   yum-updatesd 
 }.each do |srv|
  service srv do
    action :disable
  end
end

