require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:barack)
    @other_user = users(:irene)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.first_name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

    test "should redirect update when logged in as wrong user" do
      log_in_as(@other_user)
      patch :update, id: @user, user: { name: @user.first_name, email: @user.email }
      assert_not flash.empty?
      assert_redirected_to root_url
    end
end
