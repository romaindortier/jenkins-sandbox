# config valid only for current version of Capistrano
# lock '3.7'

namespace :deploy do
  task :dockerbuild do
        on release_roles :all do
      puts "============= Starting Docker Update ============="
      # execute echo $(docker ps -a -q)
      # execute "docker stop $(docker ps -a -q)"
      # execute "docker rm $(docker ps -a -q)"
    end
  end
  task :dockerbuild do
        on release_roles :all do
            within release_path do
                execute :'pwd'
                execute :'docker-compose', :build, 'webserver'
            end
        end
  end

  desc "Run containers"
  task :dockerup do
      on release_roles :all do
          within release_path do
              execute :'docker-compose', :up, "-d"
          end
      end
  end
end
