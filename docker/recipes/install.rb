# Warning: It assumes you're using Amazon Linux
# Does not support any other platform but extending it
# is trivial.

package "docker.io" do
  action :install
end

directory '/var/lib/docker/devicemapper/devicemapper/data' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

directory '/var/lib/docker/devicemapper/devicemapper/metadata' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end


service "docker" do
  action :start
end
