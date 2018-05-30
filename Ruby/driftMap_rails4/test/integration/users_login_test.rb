require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:barack)
  end

  test "Log in with invalid information" do
	  get login_path
  	assert_template 'sessions/new'
  	post login_path, session: { email: 'invalid123@iamversmart,starbux',
  													 		password: 'invalid as texas' }
  	assert_template 'sessions/new'
  	assert_not flash.empty?
  	get signup_path
  	assert flash.empty?		
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: '0')
    assert_nil cookies['remember_token']
  end
end