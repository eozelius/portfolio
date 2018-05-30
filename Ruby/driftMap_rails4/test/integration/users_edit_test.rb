require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = users(:barack)
		@admin = users(:ethan)
	end  

	test "unsuccessful edit" do
		old_name = @user.first_name
		old_email = @user.email

		log_in_as(@user)
		patch user_path(@user), user: { name: "",
																		email: 'bs_ fail-mail@aol,com',
																		password: '',
																		password_confirmation: '' }
		assert_not flash.empty?
		@user.reload
		assert_equal old_name,  @user.first_name
		assert_equal old_email, @user.email
	end

	test "admins should be able to edit own info and user's info" do
		get user_path(@admin)
		assert_template 'users/show'
		new_admin_name 	=  'new_admin_ethan'
		new_admin_email = 'new_admine.ozelius@gmail.com'
		new_user_name   = 'new_user_ethan'
		new_user_email = 'new_user_e.ozelius@gmail.com'

		log_in_as(@admin)
		patch user_path(@admin), user: {
			name: new_admin_name,
			email: new_admin_email,
			password: '',
			password_confirmation: ''
		}

		@admin.reload
		assert_equal new_admin_name, 	@admin.name
		assert_equal new_admin_email, @admin.email

		patch user_path(@user), user: {
			name: new_user_name,
			email: new_user_email,
			password: '',
			password_confirmation: ''
		}

		@user.reload
		assert_equal new_user_name,  @user.first_name
		assert_equal new_user_email, @user.email
	
	end
end