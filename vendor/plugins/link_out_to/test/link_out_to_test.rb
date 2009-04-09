require 'test/unit'
require 'rubygems'
require 'action_controller'
require 'init'

class LinkOutToTest < Test::Unit::TestCase
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper

  def test_link_out_to
    assert_equal link_to('click', 'here', :target => 'out'), link_out_to('click', 'here')
  end

end
