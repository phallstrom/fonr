namespace :application_config do 
  desc "Creates 'application-config' tag in plugins' SVN"
  task :create_svn_tag do
    system "svn rm https://application-config.googlecode.com/svn/tags/application-config -m 'removed'"
    system "svn copy https://application-config.googlecode.com/svn/trunk https://application-config.googlecode.com/svn/tags/application-config -m 'Tagging, to be able to use script/plugin install'"
  end
end