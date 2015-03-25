include_recipe "deploy"

node[:deploy].each do |application, deploy|

  Chef::Log.info("Deploying application #{application} on #{node[:opsworks][:instance][:hostname]}")

  if deploy[:application_type] != 'other'
    Chef::Log.warn("Skipping deploy::web application #{application}")
    next
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end
end
