# stop unnecessary deamons
# 
# see http://d.hatena.ne.jp/shogo0809/20091215/1260879331
# auditd - SELinux logger
# netfs - NFS client
%w{auditd  autofs  avahi-daemon  bluetooth  cups  firstboot
   gpm  hidd  isdn  ip6tables kudzu  mcstrans 
   mdmonitor netfs  nfslock  pcscd  portmap
   rawdevices  restorecond  rpcgssd  rpcidmapd  smartd  xfs
   yum-updatesd 
 }.each do |srv|
  service srv do
    action [ :stop, :disable ]
  end
end

