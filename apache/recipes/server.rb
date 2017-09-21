#
# Cookbook Name:: apache
# Recipe:: server
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
  :name => 'Jiss Joseph'
  )
end

service 'httpd' do
  action [:enable , :start]
end
