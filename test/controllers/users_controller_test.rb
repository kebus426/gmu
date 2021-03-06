require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should redirect index when not logged in" do
    get users_path
    assert_response(403)
  end
  
  test "should create user when user doesn't exist" do
    get musics_path
    log_in_as @user
    assert_redirected_to(controller: "user")
  end
  
#  test "should get new" do
#    get signup_url
#    assert_response :success
#  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { user_name: @user.user_name } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { user_name: @user.user_name} }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
