template "/root/.dockercfg" do
  source "dockercfg.erb"
  mode '0600'
  owner 'root'
  group 'root'
end
