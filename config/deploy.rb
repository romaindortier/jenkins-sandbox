# config valid only for current version of Capistrano
# lock '3.7'

namespace :deploy do
  task :dockerstop do
        on release_roles :all do
          puts "============= Starting Docker Update ============="
          # execute :'docker', :stop, 'webserver'
          # execute :'docker', :rm, 'webserver'
    end
  end

  task :dockerbuild do
        on release_roles :all do
            within release_path do
                execute :'docker-compose', :build, 'webserver'
            end
        end
  end

  desc "Varnish"
  task :varnish_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'varnish'
              # execute :'docker', :rm, 'varnish'
              execute :'docker-compose', :up, '--build', '-d', 'varnish'
          end
      end
  end

  desc "Nginx"
  task :nginx_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'nginx'
              # execute :'docker', :rm, 'nginx'
              execute :'docker-compose', :up, '--build', '-d', 'nginx'
          end
      end
  end

  desc "Redis"
  task :redis_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'redis'
              # execute :'docker', :rm, 'redis'
              execute :'docker-compose', :up, '--build', '-d', 'redis'
          end
      end
  end

  desc "Phpmyadmin"
  task :phpmyadmin_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'phpmyadmin'
              # execute :'docker', :rm, 'phpmyadmin'
              execute :'docker-compose', :up, '--build', '-d', 'phpmyadmin'
          end
      end
  end

  desc "Mongo"
  task :mongo_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'mongo'
              # execute :'docker', :rm, 'mongo'
              execute :'docker-compose', :up, '--build', '-d', 'mongo'
          end
      end
  end

  desc "Mysql"
  task :mysql_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'mysql'
              # execute :'docker', :rm, 'mysql'
              execute :'docker-compose', :up, '--build', '-d', 'mysql'
          end
      end
  end


  desc "Php fpm"
  task :phpfpm_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'php-fpm'
              # execute :'docker', :rm, 'php-fpm'
              execute :'docker-compose', :up, '--build', '-d', 'php-fpm'
          end
      end
  end


  desc "Jenkins"
  task :jenkins_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'jenkins'
              # execute :'docker', :rm, 'jenkins'
              execute :'docker-compose', :up, '--build', '-d', 'jenkins'
          end
      end
  end


  desc "Applications"
  task :applications_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'applications'
              # execute :'docker', :rm, 'applications'
              execute :'docker-compose', :up, '--build', '-d', 'applications'
          end
      end
  end


  desc "Workspace"
  task :workspace_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'workspace'
              # execute :'docker', :rm, 'workspace'
              execute :'docker-compose', :up, '--build', '-d', 'workspace'
          end
      end
  end


  desc "Rabbitmq"
  task :rabbitmq_up do
      on release_roles :all do
          within release_path do
              # execute :'docker', :stop, 'rabbitmq'
              # execute :'docker', :rm, 'rabbitmq'
              execute :'docker-compose', :up, '--build', '-d', 'rabbitmq'
          end
      end
  end
end
