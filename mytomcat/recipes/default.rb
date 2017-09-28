#
# Cookbook Name:: mytomcat
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
include_recipe 'java::default'

user 'tomcat'

group 'tomcat' do
  members 'tomcat'
  action :create
end

tomcat_install 'helloworld' do
  tarball_uri 'http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.43/bin/apache-tomcat-8.0.43.tar.gz' 
  tomcat_user 'tomcat'
  tomcat_group 'tomcat'
end

#cookbook_file '/opt/tomcat_helloworld/conf/server.xml' do
#  source 'helloworld_server.xml'
#  owner 'root'
#  group 'root'
#  mode '0644'
#  notifies :restart, 'tomcat_service[helloworld]'
#end

template '/opt/tomcat_helloworld/conf/server.xml' do
  source 'server.xml.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
  :port  => '8090'
  )
end

remote_file '/opt/tomcat_helloworld/webapps/sample.war' do
  owner 'tomcat'
  mode '0644'
  source 'https://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  checksum '89b33caa5bf4cfd235f060c396cb1a5acb2734a1366db325676f48c5f5ed92e5'
end

tomcat_service 'helloworld' do
  action [:start, :enable]
  env_vars [{ 'CATALINA_BASE' => '/opt/tomcat_helloworld/' }, { 'CATALINA_PID' => '/opt/tomcat_helloworld/bin/non_standard_location.pid' }, { 'SOMETHING' => 'some_value' }]
  sensitive true
  tomcat_user 'tomcat'
  tomcat_group 'tomcat'
end

