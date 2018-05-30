require 'test_helper'

class UserProfileTest < ActionDispatch::IntegrationTest
  def setup
  	@user_barack = users(:barack)
  	@user_irene  = users(:irene)	 
  end

=begin
  test "Barack should be able to create a post for Barack" do
  	byebug
  	assert_equal current_user.id, @user_barack.id
  	get user_path(@user_barack)
  	assert_template 'users/show'
  	assert_select 'div#create-post-container'

	end

	test "Barack should not be able to create post for Irene" do
		#get user_path(@user_)
	end
  
  test "profile display" do
    get user_path(@user_bar)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.first_name)
    assert_select 'h1', text: @user.first_name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination'
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
  end
=end

end
