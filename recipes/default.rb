#
# Cookbook Name:: chef-varnish
# Recipe:: varnish
#
# Copyright 2012, Skystack 
#
# All rights reserved - Do Not Redistribute
#

package "varnish"

directory "#{node['varnish']['storage_dir']}" do
  owner node['varnish']['user']
  group node['varnish']['group']
  action :create
  recursive true
end

execute "touch #{node['varnish']['storage_file']}" do 
  action :run
  only_if do File.exists?("#{node['varnish']['storage_dir']}") end
end

template "#{node['varnish']['dir']}/#{node['varnish']['vcl_conf']}" do
  source "default.vcl.erb"
  owner "root"
  group "root"
  mode 0644
end

template "#{node['varnish']['dir']}/maintenance.vcl" do
  source "maintenance.vcl.erb"
  owner "root"
  group "root"
  mode 0644
end

template "#{node['varnish']['default']}" do
  source "custom-default.erb"
  owner "root"
  group "root"
  mode 0644
end

service "varnish" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end

service "varnishlog" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end

service "varnish" do
  action :restart
end