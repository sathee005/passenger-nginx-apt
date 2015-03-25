
include_recipe "nginx_passenger"

nginx_passenger_site "test" do
  action :create
  dir    "/srv/www/simple/current"
  server "#{node[:opsworks][:instance][:ip]}"
  rails_env "production"
end
