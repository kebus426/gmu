require 'test_helper'

class MusicsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @music = musics(:one)
  end

  
  #test "should redirect create when not logged in" do
  #  assert_no_difference 'Music.count' do
  #    post musics_path, params: { music: { content: "Lorem ipsum" } }
  #  end
  #  assert_redirected_to login_url
  #end

  #test "should redirect destroy when not logged in" do
  #  assert_no_difference 'Music.count' do
  #    delete music_path(@music)
  #  end
  #  assert_redirected_to login_url
  #end
end
