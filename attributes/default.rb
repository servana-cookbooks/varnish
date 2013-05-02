#
# Cookbook Name:: chef-varnish
# Recipe:: varnish
#
# Copyright 2012, Skystack
#
# All rights reserved - Do Not Redistribute
#
case platform
when "debian","ubuntu"
  default['varnish']['dir'] = '/etc/varnish'
  default['varnish']['default'] = '/etc/default/varnish'
end

default['varnish']['dir'] = '/etc/varnish'
default['varnish']['default'] = '/etc/default/varnish'

default['varnish']['start'] = 'yes'
default['varnish']['nfiles'] = 131072
default['varnish']['memlock'] = 82000
default['varnish']['instance'] = node['fqdn']
default['varnish']['listen_address'] = '0.0.0.0'
default['varnish']['listen_port'] = 80
default['varnish']['vcl_conf'] = 'default.vcl'
default['varnish']['secret_file'] = '/etc/varnish/secret'
default['varnish']['admin_listen_address'] = '127.0.0.1'
default['varnish']['admin_listen_port'] = '6082'

default['varnish']['user'] = 'varnish'
default['varnish']['group'] = 'varnish'

default['varnish']['ttl'] = '120'
default['varnish']['min_threads'] ='5'
default['varnish']['max_threads'] = '500'
default['varnish']['thread_timeout'] = '300'
default['varnish']['storage'] = 'file'

default['varnish']['storage_dir'] = '/opt/varnish'
default['varnish']['storage_file'] = '/opt/varnish/varnish_storage.bin'

default['varnish']['lock_down'] = false

case node['environment']
when 'production'
	default['varnish']['storage_size'] = '10G'
when 'staging', 'development'
	default['varnish']['storage_size'] = '1G'
	default['varnish']['lock_down'] = true
end

default['varnish']['backend_host'] = 'localhost'
default['varnish']['backend_port'] = '8080'

