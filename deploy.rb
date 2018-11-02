lock "3.11.0"

set :application, "shopping-cart-app"
set :repo_url, "git@github.com:piousbox/shopping-cart-app.git"

append :linked_files, "config/database.yml"

set :deploy_via, :remote_cache

namespace :deploy do
  task :bundle do
    on roles(:web) do
      execute "cd /home/#{fetch(:app_user)}/projects/microsites3/current && sudo /home/#{fetch(:app_user)}/.rbenv/versions/2.3.1/bin/bundle --path /home/#{fetch(:app_user)}/projects/microsites3/vendor/bundle"
    end
  end

  task :restart_nginx do
    on roles(:web) do
      execute "sudo systemctl restart nginx.service"
    end
  end
end

after "deploy:published", "restart_nginx" # to clear memory for bundler
after "deploy:published", "bundle"
after "deploy:published", "restart_nginx"

