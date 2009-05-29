ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  map.root :controller => "home"

  map.helper '/helpers/:id', :controller => 'helper', :action => 'helper'
  map.user_method '/user/:action', :controller => 'user'

  map.debug_splat '/debug-splat', :controller => 'home', :action => 'debug_splat'


  map.fb_init_options '/fb-init-options/:action', :controller => 'fb_init_options'

  map.with_options :controller => 'connect' do |r|
    r.connection_required '/connect', :action => 'connection_required'
    r.logout '/connect/logout', :action => 'logout'
    r.login '/connect/login', :action => 'login'
    r.uninstall '/connect/uninstall', :action => 'uninstall'
    r.publish_user_actions '/connect/publish-user-actions', :action => 'publish_user_actions'
    r.invite_friends '/connect/invite-friends', :action => 'invite_friends'
    r.detecting_connect_status '/connect/detecting-connect-status', :action => 'detecting_connect_status'
  end


  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
