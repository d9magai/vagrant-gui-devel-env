# install plenv, perl-buid, perl interpreter

# git clone plenv
git "#{node['home']}/.plenv" do
  user  node['user']
  group  node['group']
  repository "git://github.com/tokuhirom/plenv.git"
  reference "master"
  # do nothing once 'git clone' is done
  action :checkout 
end

# mkdir
directory "#{node['home']}/.plenv/plugins/perl-build" do
  mode "0755"
  user  node['user']
  group  node['group']
  recursive true
end

# git clone perl-build
git "#{node['home']}/.plenv/plugins/perl-build" do
  user  node['user']
  group  node['group']
  repository "git://github.com/tokuhirom/Perl-Build.git"
  reference "master"
  action :checkout 
end

# append to bashrc
execute "append to bashrc" do
  user node['user']
  command <<-EOH
        echo 'export PATH="$HOME/.plenv/bin:$PATH"' >> #{node['home']}/.bashrc
        echo 'eval "$(plenv init -)"' >> #{node['home']}/.bashrc
  EOH
  not_if "grep plenv #{node['home']}/.bashrc"
  action :run
end

# install perl and cpanm
bash "install perl and cpanm" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.plenv/bin/plenv rehash
        #{node['home']}/.plenv/plugins/perl-build/bin/plenv-install #{node['perl_version']}
        #{node['home']}/.plenv/bin/plenv global #{node['perl_version']}
        #{node['home']}/.plenv/bin/plenv rehash
        #{node['home']}/.plenv/bin/plenv install-cpanm
        #{node['home']}/.plenv/bin/plenv rehash
   EOC
  
  not_if { File.exist?("#{node['home']}/.plenv/shims/perl#{node['perl_version']}") }
  action :run
end

