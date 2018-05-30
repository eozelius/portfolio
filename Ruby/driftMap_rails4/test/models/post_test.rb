require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@user = users(:barack)
	end

	test "Post should have all required properties " do
		# empty body
		post = Post.create(title: 'valid title',
											 body: 	'',
											 user_id: @user.id,
											 init_x: 43,
											 init_y: -73,
											 init_zoom: 13)
		assert_not post.valid? 
		# empty title
		post = Post.create(title: '',
											 body: 	'valid_body',
											 user_id: @user.id,
											 init_x: 43,
											 init_y: -73,
											 init_zoom: 13)
		assert_not post.valid?

		# empty user_id
		post = Post.create(title: 'valid_title',
											 body: 	'valid_body',
											 user_id: nil,
											 init_x: 43,
											 init_y: -73,
											 init_zoom: 13)
		assert_not post.valid?

		# empty init_x
		post = Post.create(title: 'valid_title',
											 body: 	'valid_body',
											 user_id: @user.id,
											 init_x: nil,
											 init_y: -73,
											 init_zoom: 13)
		assert_not post.valid?

		# Valid Post
		post = Post.create(title: 'valid',
											 body: 'valid',
											 user_id: @user.id,
											 init_x: 43,
											 init_y: -73,
											 init_zoom: 13)
		assert post.valid?
	end

	test "Post should be destroyed when user who created post is destoryed" do
		@user.save
		
		assert_difference 'Post.count', -1 do
			@user.destroy
		end
	end
end
