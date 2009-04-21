class SamplePublisher < Facebooker::Rails::Publisher

  def sample_template
    one_line_story_template "{*actor*} spent some of {*hisher*} time on {*weekday*} exploring Facebooker on Rails."
    action_links action_link('Check it out!', 'http://facebooker.pjkh.com')
  end

  def sample(user)
    send_as :user_action
    from user.facebook_session.user
    story_size ONE_LINE
    data :hisher => (case user.facebook_session.user.sex when 'male' then 'his' when 'female' then 'her' else 'their' end),
         :weekday => Date.today.strftime('%A')
  end
  
end
