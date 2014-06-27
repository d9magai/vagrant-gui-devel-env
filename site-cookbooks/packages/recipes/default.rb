# yum install base packages
#
%w{
gcc
make
nkf
wget
git
openssl-devel
webkitgtk-devel
sqlite-devel
}.each do |pkg|
  package pkg do
    action :install
  end
end
