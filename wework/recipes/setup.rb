remote_file "~/.dockercfg" do
  source "https://s3.amazonaws.com/spaceman-docker/.dockercfg"
  action :create_if_missing
end
