class User < ActiveRecord::Base
  
  #
  # Borrowed from facebooker_authentication plugin.
  #
  def facebook_session
    return nil if facebook_session_key.blank?
    @facebook_session ||= returning Facebooker::Session.create do |session| 
      session.secure_with!(facebook_session_key, facebook_id, 1.hour.from_now) 
      Facebooker::Session.current = session
    end
  end
end
