#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, JN2 e-commerce expert
#
# All rights reserved - Do Not Redistribute
#
if node["platform"] == "ubuntu"
	execute "apt-get update -y" do
	end
end

package "apache2" do
	package_name node["apache"]["package"]
end

node["apache"]["sites"].each do |sitename, data| #irá ler os atributos definidos em attributes/default.rb
  document_root = "/content/sites/#{sitename}"

  directory document_root do #irá criar o document_root caso não exista
    mode "0755"
    recursive true #irá criar todos a estrutura de diretórios caso não exista
  end

  if node["platform"] == "ubuntu"
	template_location = "/etc/apache2/sites-enabled/#{sitename}.conf"
  elsif node["platform"] == "centos"
	template_location = "/etc/httpd/conf.d/#{sitename}.conf"
  end


  template template_location do # este local será aplicado no cliente
    source "vhost.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => data["port"],
      :domain => data["domain"]
    )

    notifies :restart, "service[httpd]" #irá dar o restart no serviço

  end

  template "#{document_root}/index.html" do
    source "index.html.erb"
    mode "0644"
    variables(
      :site_title => data["site_title"],
      :commingsoon => "Em breve",
      :author_name => node["author"]["name"]
    )
  end
end

execute "rm /etc/httpd/conf.d/welcome.conf" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
	notifies :restart, "service[httpd]"
end

execute "rm /etc/httpd/conf.d/README" do
	only_if do
		File.exist?("/etc/httpd/conf.d/README")
	end
	notifies :restart, "service[httpd]"
end			

service "httpd" do
	service_name node["apache"]["package"]
	action [:enable, :start]
end

#include_recipe "php::default" #inclui o recipe do php aqui no recipe do apache
