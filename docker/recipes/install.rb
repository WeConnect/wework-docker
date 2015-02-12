# Warning: It assumes you're using Amazon Linux
# Does not support any other platform but extending it
# is trivial.

package "docker.io" do
  action :install
end

ruby_block 'mount /var/lib/docker' do
  block do
    Chef::Log.debug("/var/lib/docker probably not yet mounted - sleeping 10s")
    sleep 10
  end
end

service "docker" do
  action :start
end
