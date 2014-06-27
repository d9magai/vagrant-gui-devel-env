# yum install base packages
#
%w{
firefox
vim
terminator
}.each do |pkg|
  package pkg do
    action :install
  end
end

