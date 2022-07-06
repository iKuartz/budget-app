require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get splash' do
    get home_splash_url
    assert_response :success
  end
end
