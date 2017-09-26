#
# Cookbook Name:: myhaproxy
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
node.default['haproxy']['members'] = [
   { "hostname" => 'ec2-13-59-48-78.us-east-2.compute.amazonaws.com',
     "ipaddress" => '13.59.48.78',
     "port" => '80',
     "ssl_port" => '80'
   },
   {
     "hostname" => 'ec2-18-220-144-176.us-east-2.compute.amazonaws.com',
     "ipaddress" => '18.220.144.176',
     "port" => '80',
     "ssl_port" => '80' 
   }

]

include_recipe 'haproxy::manual'
