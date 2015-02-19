include_recipe 'apt::repository'

package 'apt-transport-https' do
  action :install
end

apt_repository 'docker' do
  uri 'https://get.docker.com/ubuntu'
  components ['main']
  keyserver 'keyserver.ubuntu.com'
  key '36A1D7869245C8950F966E92D8576A8BA88D21E9'
  deb_src true
end

package "lxc-docker" do
  action :install
end

# ruby_block 'mount /var/lib/docker' do
#   block do
#     Chef::Log.debug("/var/lib/docker probably not yet mounted - sleeping 10s")
#     sleep 10
#   end
# end

service "docker" do
  action :start
end
