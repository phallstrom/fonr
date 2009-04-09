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

  def invite
    if params[:ids].blank?
      flash[:invitation] = :canceled
    else
      flash[:invitation] = :sent
    end
    redirect_to toy_url(params[:voted_on_toy_id])
  end

end
