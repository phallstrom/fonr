require 'test/unit'
require 'application_config'

RAILS_ROOT = '.'
RAILS_ENV  = 'test'

class ApplicationConfigTest < Test::Unit::TestCase
  
  def test_assert_should_throw_exeption_if_no_config_file_found
    assert_raise RuntimeError do
       ApplicationConfig::load('foobar.yml')
    end
  end
  
  def test_should_load_valid_config
    assert_nothing_raised do 
      ApplicationConfig::load(path_to_fixture('application_config.yml'))
    end
  end
  
  def test_returns_correct_config_properties
    ApplicationConfig::load(path_to_fixture('application_config.yml'))
    assert_equal('test.com', property(:base_url))
    
    Kernel.const_set('RAILS_ENV', 'production')
    assert_equal('production.com', property(:base_url))
  end
  
  def test_property_is_aliased
    ApplicationConfig::load(path_to_fixture('application_config.yml'))
    assert_equal('test.com', prop(:base_url))
  end
  
  def test_should_properly_process_erb_enabled_properties
    ApplicationConfig::load(path_to_fixture('application_config.yml'))
    assert_equal 1, prop(:erb_enabled_property)
  end
  
  private
  def path_to_fixture(filename)
    File.join(File.dirname(__FILE__), "/../fixtures/#{filename}")
  end
end
