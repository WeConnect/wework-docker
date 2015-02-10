remote_file File.expand_path("~/.dockercfg") do
  source "https://s3.amazonaws.com/spaceman-docker/.dockercfg"
  action :create_if_missing
end
