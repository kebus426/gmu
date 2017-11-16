require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         'God Music Uploader'
    assert_equal full_title("Help"), 'Help | God Music Uploader'
  end
end
