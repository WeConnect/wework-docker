#
# Cookbook Name:: wework-docker-gen
# Recipe:: default
#
# Copyright (C) 2015 Tom Clark
#
# All rights reserved - Do Not Redistribute
#

cache_path = ::File.join(Chef::Config['file_cache_path'], "wework-docker-gen")
dg_file_name = ::File.basename(node['docker-gen']['url'])
dg_file_path = ::File.join(cache_path, dg_file_name)
dg_extract_path = ::File.join(cache_path, node['docker-gen']['version'])
dg_command_path = ::File.join('', *%w[usr local bin])

directory cache_path do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

remote_file dg_file_path do
  owner 'root'
  group 'root'
  mode '0644'
  source node['docker-gen']['url']
  checksum node['docker-gen']['checksum']
end

bash "install docker-gen #{node['docker-gen']['version']}" do
  user 'root'
  cwd cache_path
  code <<-EOH
    mkdir -p #{dg_extract_path}
    tar --overwrite -xzf #{dg_file_path} -C /#{dg_command_path}
  EOH

  not_if { ::Dir.exist?(dg_extract_path) && ::File.exist?(::File.join(dg_command_path, 'docker-gen')) }
end
