require 'test_helper'

class PostsControllerTest < ActionController::TestCase
 	def setup
    @user = users(:irene)
    @post = posts(:irenes_post)
  end

  test "Valid Post should be created" do
    log_in_as(@user)

    # first delete post
    assert_difference 'Post.count', -1 do
      delete :destroy, id: @post
    end


    # create new post
    assert_difference 'Post.count', 1 do
      post :create, post: {
        title: @post.title,
        body:  @post.body,
        user_id: @post.user_id,
        init_x: @post.init_x,
        init_y: @post.init_y,
        init_zoom: @post.init_zoom
      }
    end
  end

  test "invalid Post should not be created" do
    log_in_as(@user)

    get :new

    assert_no_difference 'Post.count' do
      p = post :create, post: {
        title: '',
        body:  @post.body,
        user_id: @post.user_id,
        init_x: @post.init_x,
        init_y: @post.init_y,
        init_zoom: @post.init_zoom
      }
    end
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Post.count' do
      post :create, post: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong post" do
    # log in as barack and try to delete Irene's shit
    @barack = users(:barack)
    log_in_as(@barack)

    assert_no_difference 'Post.count' do
      delete :destroy, id: @post
    end

    assert_redirected_to root_url
  end

  test "get :edit action should respond" do
    get :edit, id: @post
    assert_response :success
  end

  test "bullshit update should fail" do
    log_in_as(@user)
    old_title = @post.title
    old_body  = @post.body

    get :edit, id: @post
    assert_template 'edit'

    patch :update, id: @post, post: {
      title: '',
      body:  '',
      init_x: nil,
      init_y: nil
    }

    @user.reload
    assert_equal @user.post.title, old_title
  end

  test "valid update should update post" do
    log_in_as(@user)
    new_title = 'new fucking title'
    new_body  = 'new fucking body'
    new_init_x= 15

    patch :update, id: @post, post: {
      title: new_title,
      body:  new_body,
      init_x: new_init_x
    }

    assert_redirected_to @user
    @user.reload

    assert_equal @user.post.title,  new_title
    assert_equal @user.post.body,   new_body
    assert_equal @user.post.init_x, new_init_x
  end
end