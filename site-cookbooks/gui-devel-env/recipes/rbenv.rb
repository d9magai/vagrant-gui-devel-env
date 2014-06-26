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


execute "install rubygems-update" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  command <<-EOH
        #{node['home']}/.rbenv/shims/gem install rubygems-update
        #{node['home']}/.rbenv/shims/update_rubygems
        #{node['home']}/.rbenv/shims/gem pristine --all
  EOH
  not_if { File.exist?("#{node['home']}/.rbenv/shims/update_rubygems") }
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

# install ruby-debug-ide
bash "install ruby-debug-ide" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install ruby-debug-ide
   EOC
  
  not_if { File.exist?("#{node['home']}/.rbenv/shims/rdebug-ide") }
  action :run
end

# install rspec
bash "install rspec" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install rspec
   EOC
  
  not_if { File.exist?("#{node['home']}/.rbenv/shims/rspec") }
  action :run
end

# install sdoc
bash "install sdoc" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install sdoc
   EOC
  
  not_if { File.exist?("#{node['home']}/.rbenv/shims/sdoc") }
  action :run
end

# install therubyracer
bash "install therubyracer" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install therubyracer
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep therubyracer"
  action :run
end

# install coffee-rails
bash "install coffee-rails" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install coffee-rails
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep coffee-rails"
  action :run
end

# install sqlite3
bash "install sqlite3" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install sqlite3
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep sqlite3"
  action :run
end

# install sass-rails
bash "install sass-rails" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install sass-rails
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep sass-rails"
  action :run
end

bash "install uglifier" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install uglifier
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep uglifier"
  action :run
end

bash "install jquery-rails" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install jquery-rails
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep jquery-rails"
  action :run
end

bash "install turbolinks" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install turbolinks
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep turbolinks"
  action :run
end

bash "install jbuilder -v 1.2" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install jbuilder -v 1.2
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep jbuilder"
  action :run
end

bash "install execjs" do
  user  node['user']
  group  node['group']

  environment 'HOME' => "#{node['home']}"
  code <<-EOC
        #{node['home']}/.rbenv/shims/gem install execjs
   EOC
  
  not_if "#{node['home']}/.rbenv/shims/gem list | grep execjs"
  action :run
end

