require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  # returns true is a test user is logged in
  def is_logged_in?
    if session[:user_id].nil?
      return false
    else
      return true
    end
  end

  def log_in_as(user, options = {})
    password    = options[:password]    || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { email: user.email,
                                  password: password,
                                  remember_me: remember_me }
    else
      session[:user_id] = user.id
    end
  end

  private
    def integration_test?
      defined?(post_via_redirect)
    end

end
