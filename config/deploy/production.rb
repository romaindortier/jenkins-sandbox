# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
# server 'db.example.com', user: 'deploy', roles: %w{db}
server '46.101.23.88', user: 'root', roles: %w{docker}

# set :deploy_via, :copy
set :scm, :git
set :application, 'jenkins-sandbox'
set :repo_url, 'git@github.com:romaindortier/jenkins-sandbox' # example git@github.com:capistrano/capistrano.git
set :deploy_via, :remote_cache

set :branch,      "master"
set :deploy_to, '/home'

set :keep_releases, 1


# after 'deploy:updating', 'deploy:dockerstop'
# after 'deploy:updating', 'deploy:dockerbuild'
# after 'deploy:updating', 'deploy:dockerup'
# after 'deploy:updating', 'deploy:workspace_up'
# after 'deploy:updating', 'deploy:mysql_up'
after 'deploy:updating', 'deploy:nginx_up'
# after 'deploy:updating', 'deploy:phpfm_up'
# after 'deploy:updating', 'deploy:applications_up'
after 'deploy:updating', 'deploy:phpmyadmin_up'
# after 'deploy:updating', 'deploy:rabbitmq_up'
# after 'deploy:updating', 'deploy:redis_up'
# after 'deploy:updating', 'deploy:mongo_up'
# after 'deploy:updating', 'deploy:varnish_up'
# after 'deploy:updating', 'deploy:jenkins_up'