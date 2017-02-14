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
                execute :'docker-compose', :build, 'webserver', raise_on_non_zero_exit: false
            end
        end
  end

  desc "Varnish"
  task :varnish_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'varnish', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'varnish', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'varnish', raise_on_non_zero_exit: false
          end
      end
  end

  desc "Nginx"
  task :nginx_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'nginx', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'nginx', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'nginx', raise_on_non_zero_exit: false
          end
      end
  end

  desc "Redis"
  task :redis_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'redis', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'redis', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'redis', raise_on_non_zero_exit: false
          end
      end
  end

  desc "Phpmyadmin"
  task :phpmyadmin_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'phpmyadmin', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'phpmyadmin', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'phpmyadmin', raise_on_non_zero_exit: false
          end
      end
  end

  desc "Mongo"
  task :mongo_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'mongo', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'mongo', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'mongo', raise_on_non_zero_exit: false
          end
      end
  end

  desc "Mysql"
  task :mysql_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'mysql', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'mysql', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'mysql', raise_on_non_zero_exit: false
          end
      end
  end


  desc "Php fpm"
  task :phpfpm_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'php-fpm', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'php-fpm', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'php-fpm', raise_on_non_zero_exit: false
          end
      end
  end


  desc "Jenkins"
  task :jenkins_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'jenkins', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'jenkins', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'jenkins', raise_on_non_zero_exit: false
          end
      end
  end


  desc "Applications"
  task :applications_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, '-f', 'applications', raise_on_non_zero_exit: false
              execute :'docker', :rm, '-f', 'applications', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'applications', raise_on_non_zero_exit: false
          end
      end
  end

  desc "Workspace"
  task :workspace_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'workspace', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'workspace', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'workspace', raise_on_non_zero_exit: false
          end
      end
  end


  desc "Rabbitmq"
  task :rabbitmq_up do
      on release_roles :all do
          within release_path do
              execute :'docker', :stop, 'rabbitmq', raise_on_non_zero_exit: false
              execute :'docker', :rm, 'rabbitmq', raise_on_non_zero_exit: false
              execute :'docker-compose', :up, '--build', '-d', 'rabbitmq', raise_on_non_zero_exit: false
          end
      end
  end


    desc 'Install dependencies'
    task :composer_run do
        on roles(:app) do
            within release_path do
                execute :docker , :exec, "-u", "www-data", "-i", "workspace", "composer", "install"
            end
        end
    end

end
