# create user
user node['user'] do
  home node['home']
  shell "/bin/bash"
  password nil
  supports :manage_home => true
end

# append to bashrc
execute "edit /etc/sudoers" do
  command <<-EOH
        echo '# === added by recipe user.rb ===' >> /etc/sudoers
        echo '# allow shutdown for wheel'        >>  /etc/sudoers
        echo '%wheel ALL=(ALL) NOPASSWD: /sbin/shutdown, /sbin/reboot'  >>  /etc/sudoers
  EOH
  not_if "grep user.rb /etc/sudoers"
  action :run
end
