# yum install base packages
#
%w{
firefox
vim
terminator
xclip
}.each do |pkg|
  package pkg do
    action :install
  end
end

script_url = 'http://chrome.richardlloyd.org.uk/install_chrome.sh'
script_name = File.basename script_url
execute 'install google-chrome-stable' do
  command  <<-EOH
    wget #{script_url} -P /tmp
    chmod +x /tmp/#{script_name}
    /tmp/#{script_name} -f
  EOH
  not_if 'yum list installed | grep google-chrome-stable'
end

