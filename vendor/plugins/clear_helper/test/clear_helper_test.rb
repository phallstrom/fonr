require 'test/unit'
require 'rubygems'
require 'action_controller'
require 'init'

class ClearHelperTest < Test::Unit::TestCase
  include ActionView::Helpers::TagHelper

  def test_clear_helper
    assert_equal '<div style="clear: both; font-size: 0; height: 0; line-height: 0; max-height: 0">&nbsp;</div>', clear
    assert_equal '<div style="clear: left; font-size: 0; height: 0; line-height: 0; max-height: 0">&nbsp;</div>', clear(:left)
    assert_equal '<div style="clear: left; font-size: 0; height: 0; line-height: 0; max-height: 0">&nbsp;</div>', clear('left')
    assert_equal '<div style="clear: right; font-size: 10px; height: 10px; line-height: 10px; max-height: 10px">&nbsp;</div>', clear(:right, 10)
    assert_equal '<div style="clear: both; font-size: 2.5em; height: 2.5em; line-height: 2.5em; max-height: 2.5em">&nbsp;</div>', clear('2.5em')
    assert_equal '<div style="clear: both; font-size: 5px; height: 5px; line-height: 5px; max-height: 5px">&nbsp;</div>', clear(5)
    assert_equal '<div style="clear: both; font-size: 0; height: 0; line-height: 0; max-height: 0">&nbsp;</div>', clear(:clear => :both)
    assert_equal '<div style="clear: both; font-size: 0; height: 0; line-height: 0; max-height: 0">&nbsp;</div>', clear(:clear => :both)
    assert_equal '<div style="clear: both; font-size: 5px; height: 5px; line-height: 5px; max-height: 5px; width: 99%">&nbsp;</div>', clear(:clear => :both, :height => 5, :width => '99%')
    assert_equal '<div style="clear: both; font-size: 0; height: 0; line-height: 0; max-height: 0; width: 99%">&nbsp;</div>', clear(:width => '99%')
  end
end
