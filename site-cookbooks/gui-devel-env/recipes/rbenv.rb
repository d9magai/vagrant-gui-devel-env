# install rbenv, ruby, bundler, rails

# git clone rbenv
git "#{node['home']}/.rbenv" do
  user  node['user']
  group  node['group']
  repository "https://github.com/sstephenson/rbenv.git"
  reference "master"
  # do nothing once 'git clone' is done
  action :checkout 
end

# mkdir
directory "#{node['home']}/.rbenv/plugins/ruby-build" do
  mode "0755"
  user  node['user']
  group  node['group']
  recursive true
end

# git clone ruby-build
git "#{node['home']}/.rbenv/plugins/ruby-build" do
  user  node['user']
  group  node['group']
  repository "https://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :checkout 
end

# append to bashrc
execute "append to bashrc" do
  user node['user']
  command <<-EOH
        echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> #{node['home']}/.bashrc
        echo 'eval "$(rbenv init -)"' >> #{node['home']}/.bashrc
  EOH
  not_if "grep rbenv #{node['home']}/.bashrc"
  action :run
end

# install ruby
bash "install ruby" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/bin/rbenv install #{node['ruby_version']}
        #{node['home']}/.rbenv/bin/rbenv rehash #{node['ruby_version']}
        #{node['home']}/.rbenv/bin/rbenv global #{node['ruby_version']}
   EOC
  
  not_if { File.exist?("#{node['home']}/.rbenv/bin/ruby") }
  action :run
end

# append to gemrc
execute "append to gemrc" do
  user node['user']
  command <<-EOH
        echo 'gem: --no-ri --no-rdoc'  >> #{node['home']}/.gemrc
  EOH
  not_if "grep --no-ri #{node['home']}/.gemrc"
  action :run
end

# install rails
bash "install rails" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem sources -a http://gems.rubyforge.org/
        #{node['home']}/.rbenv/shims/gem install rails
   EOC
  
  not_if { File.exist?("#{node['home']}/.rbenv/shims/rails") }
  action :run
end

