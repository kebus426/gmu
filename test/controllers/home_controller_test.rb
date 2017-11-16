require 'test_helper'
class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | God Music Uploader"
  end

  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Index | God Music Uploader"
  end


  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | God Music Uploader"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | God Music Uploader"
  end

end
