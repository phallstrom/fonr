ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  map.root :controller => "home"

  map.with_options :controller => 'connect' do |r|
    r.logout '/connect/logout', :action => 'logout'
    r.login '/connect/login', :action => 'login'
    r.uninstall '/connect/uninstall', :action => 'uninstall'
    r.invite '/connect/invite', :action => 'invite'
  end

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
