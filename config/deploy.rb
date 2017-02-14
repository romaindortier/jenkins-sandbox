# config valid only for current version of Capistrano
lock '3.5.0'

namespace :deploy do
  task :dockerbuild do
        on release_roles :all do
      image_name = fetch(:image_name)
      account = fetch(:account)

      puts "============= Starting Docker Update ============="
      # execute "docker stop $(docker ps -a -q)"
      # execute "docker rm $(docker ps -a -q)"
    end
  end
  task :dockerbuild do
        on release_roles :all do
            within release_path do
                execute :'pwd'
                execute :'echo', :release_path
                execute :'docker-compose', :build
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
