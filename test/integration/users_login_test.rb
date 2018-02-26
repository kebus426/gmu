# coding: utf-8
require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  require 'test_helper'
  def setup
    @user = users(:michael)
  end

end
