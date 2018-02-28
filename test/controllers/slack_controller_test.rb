require 'test_helper'

class SlackControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get slack_new_url
    assert_response :success
  end

end
