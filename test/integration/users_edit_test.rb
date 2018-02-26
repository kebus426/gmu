require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { user_name: ""} }
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    assert_redirected_to edit_user_url(@user)
    user_name = "Foo Bar"
    patch user_path(@user), params: { user: { user_name:  user_name} }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal user_name,  @user.user_name
  end

  
  
end
