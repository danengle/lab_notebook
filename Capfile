load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

desc "Restarting after deployment"
task :after_deploy, :roles => [:app, :db, :web] do
	run "sed 's/# ENV\\[/ENV\\[/g' #{deploy_to}/current/config/environment.rb > #{deploy_to}/current/config/environment.temp"
	run "mv #{deploy_to}/current/config/environment.temp #{deploy_to}/current/config/environment.rb"
end

desc "Link shared files"
task :before_symlink do
	run "rm -drf #{release_path}/public/attachments"
	run "ln -s #{shared_path}/attachments #{release_path}/public/attachments"
	
	run "rm -drf #{release_path}/config/database.yml"
	run "ln -s #{shared_path}/database.yml #{release_path}/config/database.yml"
end

