# -*- coding: utf-8 -*-
# localeの設定

execute "setting locale" do
  command "localedef -f UTF-8 -i ja_JP ja_JP"
  not_if "locale | grep ja_JP.utf8"
end

template "/etc/sysconfig/i18n" do
  owner 'root'
  group 'root'
  mode "0644"
end

execute "set timezone" do
  command <<-EOH
    cp /usr/share/zoneinfo/Japan /etc/localtime
  EOH
  action :run
end

