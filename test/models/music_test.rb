# coding: utf-8
require 'test_helper'

class MusicTest < ActiveSupport::TestCase
 
  def setup
    @user = users(:michael)

    @music = @user.musics.build(music_name: "music", caption: "hogefuga", file: File.open("file.wav"))
    end

  test "should be valid" do
    assert @music.valid?
  end

  test "extension should not be valid" do
    @newMusic = @user.musics.build(music_name: "music", caption: "hogefuga", file: File.open("file.txt"))
    assert_not @newMusic.valid?
  end

  test "user id should be present" do
    @music.user_id = nil
    assert_not @music.valid?
  end

  test "name should be present" do
    @music.music_name = "   "
    assert_not @music.valid?
  end
  
  test "caption should be at most 140 characters" do
    @music.caption = "a" * 141
    assert_not @music.valid?
  end

  test "order should be most recent first" do
    assert_equal musics(:most_recent), Music.first
  end
end
