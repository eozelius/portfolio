require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest

	def setup
		ActionMailer::Base.deliveries.clear
		@user = users(:irene)
	end

	test "password resets" do 
		get new_password_reset_path
		assert_template 'password_resets/new'

		# Invalid email
		post password_resets_path, password_resets: { email: "" }
		assert_not flash.empty?
		assert_template 'password_resets/new'

		# Valid email
		post password_resets_path, password_resets: { email: @user.email }
		assert_not_equal @user.reset_digest, @user.reload.reset_digest
		assert_equal 1, ActionMailer::Base.deliveries.size
		assert_not flash.empty?
		assert_redirected_to root_url

		# Password Reset form
    user = assigns(:user)

    # Wrong email
    get edit_password_reset_path(user.password_reset_token, email: "")
    assert_redirected_to root_url

    # Right email Wrong token
    get edit_password_reset_path("Wrong token", email: user.email)
    assert_redirected_to root_url

    # Right email, right token
    get edit_password_reset_path(user.password_reset_token, email: user.email)
    assert_template 'password_resets/edit'
    assert_select "input[name=email][type=hidden][value=?]", user.email

    # Invalid password & confirmation
    patch password_reset_path(user.password_reset_token),
    	email: user.email,
    	user: {
    		password: "foobar",
    		password_confirmation: "not_foobar"
    	}
    assert_select 'div.flash-danger'

    # Empty password
    patch password_reset_path(user.password_reset_token),
    			email: user.email,
    			user: {
    				password: '',
    				password_confirmation: ''
    			}
    	assert_select 'div.flash-danger'

    # Valid password and Confirmation
    patch password_reset_path(user.password_reset_token),
    			email: user.email,
    			user: {
    				password: 'foobar',
    				password_confirmation: 'foobar'
    			}
    assert is_logged_in?
    assert_not flash[:success].empty?
    assert_redirected_to user
  end
end
