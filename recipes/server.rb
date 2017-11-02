#
# Cookbook:: myiis
# Recipe:: server
#
# Copyright:: 2017, The Authors, All Rights Reserved.
powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  action :run
end

# file 'C:\inetpub\wwwroot\Default.htm' do
template 'C:\inetpub\wwwroot\Default.htm' do
  source 'Default.htm.erb'
  # content "<h1>Hello, world!</h1>
  # <h2>PLATFORM: #{node['platform']}</h2>
  # <h2>HOSTNAME: #{node['hostname']}</h2>
  # <h2>MEMORY: #{node['memory']}</h2>
  # <h2>CPU Mhz: #{node['cpu']['0']['mhz']}</h2>"
  # rights :read, 'Everyone'
end

service 'w3svc' do
  action [ :enable, :start ]
end
