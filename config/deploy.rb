set :scm, :git
set :repository, "git://github.com/phallstrom/fonr.git"
set :local_repository, "git://github.com/phallstrom/fonr.git"
set :deploy_to, "/home/philip/apps/facebooker.pjkh.com"
set :runner, "philip"
set :use_sudo, false

set :keep_releases, 1

set :deploy_via, :remote_cache

role :app, "sheldon.pjkh.com"
role :web, "sheldon.pjkh.com"
role :db,  "sheldon.pjkh.com", :primary => true, :no_release => true

namespace :deploy do

  desc "Restarts your application."
  task :restart, :roles => :app, :except => { :no_release => true } do
    as = fetch(:runner, "app")
    via = fetch(:run_method, :sudo)
    invoke_command "touch #{current_path}/tmp/restart.txt", :via => via, :as => as
  end

  [:start, :stop].each do |t|
    desc "No-op with mod_rails."
    task t, :roles => :app do ; end
  end

end


