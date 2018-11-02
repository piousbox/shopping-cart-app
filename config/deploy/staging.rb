
set :deploy_user, 'ubuntu'
set :deploy_to, "/home/ubuntu/projects/shopping-cart-app"
set :app_user, "ubuntu"

server 'do', :user => 'ubuntu', :roles => [ :web ], :primary => true
