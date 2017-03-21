#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2017, JN2 e-commerce expert
#
# All rights reserved - Do Not Redistribute
#
package "php" do
	action :install
end

cookbook_file "/etc/php.ini" do #fará o upload do arquivo presente no workstation caso haja alguma alteração
	source "php.ini"
	mode "0644"
end
