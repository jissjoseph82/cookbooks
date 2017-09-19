#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

file '/var/www/html/index.html' do
  content "System Info
  
  IPADDRESS : #{node['ipaddress']}
  HOSTNAME  : #{node['hostname']}
  CPU       : #{node['cpu']['0']['mhz']}
  "
end

service 'httpd' do
  action [:enable , :start]
end
