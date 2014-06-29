# yum install base packages
#
%w{
gcc
gcc-c++
make
nkf
wget
git
ruby
bison
openssl-devel
webkitgtk-devel
sqlite-devel
}.each do |pkg|
  package pkg do
    action :install
  end
end

