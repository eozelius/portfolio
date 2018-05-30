require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new( name: "Kooper daShoe", email: "koop2dashoop@gmail.com", 
                      password: "jayNOne12", password_confirmation: "jayNOne12" )
  end

  test 'koop the valid user, should be valid' do
		assert @user.valid?
  end

  test 'name and email should be present' do
  	@user.first_name = "     "
  	assert_not @user.valid?
  	@user.email = ""
  	assert_not @user.valid?
  end

  test 'name should not be too long' do
  	@user.first_name = "a" * 55 + "el III"
  	assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "z" * 244 + "@example.com"
		assert_not @user.valid?
	end

  test "email validation should accept valid addresses" do
    valid_emails = %w[frank@eltank.com h.hoover1913@aol.com myCuzVinzster24@yahoo.com]
    valid_emails.each do |email|
      @user.email = email
      assert @user.valid?, "#{email.inspect}"
    end
  end

  test "email validation should swat down bullshit addresses" do
    invalids = %w[ bull_shit+tard@hotmail,com, ivanelfuckhead~@gmail.com, che%lovesTom/brandy1111@horseMail,com]
    invalids.each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end

  test "emails must be unique" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end

  test "passwords should be present (non-blank)" do
    @user.password = @user.password_confirmation = " " * 6
    puts @user.password
    assert_not @user.valid?
  end

  test "passwords should have minimum length" do
    @user.password = @user.password_confirmation = "%" * 4
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end
end
