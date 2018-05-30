require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "invalid signup data should fail" do 
  	get signup_path
  		assert_no_difference 'User.count' do
  			post users_path, user: { name: "", 
  															 email: "invalidUser@invalid.com",
  															 password: "foo",
  															 password_confirmation: "bar"
  														 }
  		end
  	assert_template 'users/new'
  	assert_select 'div.errors'
  end

  test "valid signup with valid data & account activation should pass" do
  	get signup_path
  	assert_difference 'User.count', 1 do
      post users_path, user: { name: "Miagi Proper",
  	   										     email: "properEmail@gmail.com",
    													 password: "Japan123",
  														 password_confirmation: "Japan123" }
    end
      
    assert_equal 1, ActionMailer::Base.deliveries.size
    user = assigns(:user)
    assert_not user.activated?
    log_in_as(user)
    
    get edit_account_activation_path(user.activation_token, email: user.email)
    assert user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end