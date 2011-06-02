require File.dirname(__FILE__) + '/test_helper'

class ActsAsFilterableTest < ActiveSupport::TestCase
  setup do
    DatabaseCleaner.start
    @abba = Factory(:abba)
    @simon_and_garfunkel = Factory(:simon_and_garfunkel)
    @beatles = Factory(:beatles)
  end

  test 'working base case' do
    assert Band.filtered({}).all
  end

  test "return all bands" do
    assert_equal 3, Band.filtered({}).count
  end
  
  test "allow selection by one scope" do
    assert_equal [@abba], Band.filtered(:by_country => "se").all
  end
  
  test "allow chaining of scopes" do
    assert_equal [@simon_and_garfunkel], Band.filtered(:by_country => 'us', :by_genre => 'pop').all
  end
  
  test "allow attribute filtering" do
    assert_equal @simon_and_garfunkel, Band.filtered(:size => 2).first
  end

  teardown do
    DatabaseCleaner.clean
  end
end