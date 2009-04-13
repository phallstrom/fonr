class ConnectController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => ['uninstall', 'invite']

  def login
    redirect_to root_path and return unless request.xhr?
    render :partial => 'shared/fb_connect'
  end

  def logout
    session[:user_id] = nil
    @current_user = nil

    redirect_to root_path and return unless request.xhr?
    render :partial => 'shared/fb_connect'
  end

  # http://wiki.developers.facebook.com/index.php/Post-Remove_URL
  def uninstall
    User.find_by_facebook_id(params[:fb_sig_user]).destroy rescue nil
    render :nothing => true
  end

  # Processing ConnectController#invite (for 127.0.0.1 at 2009-04-13 15:45:21) [POST]
  # Parameters: {"ids"=>["1685645931"], "mfs_typeahead_req_form_49e3c070ee9e31811502384"=>"Start Typing a Friend's Name"}
  def invite
  end

end
