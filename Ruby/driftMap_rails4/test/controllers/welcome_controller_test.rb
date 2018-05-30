require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase

  def setup
  end

  test "Root url should be accessible" do
    get :index
    assert_response :success
    assert_template :index
  end
end