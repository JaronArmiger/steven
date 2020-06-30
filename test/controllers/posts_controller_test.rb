require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@post = posts(:one)
    @user = users(:alfonso)
    @original_content = @post.content
    @original_font_color = @post.font_color
    @original_body_color = @post.body_color
  end

  test "should redirect create when not logged in" do
  	assert_no_difference 'Post.count' do
  	  post posts_path params: { post: { content: "somos idiotas" } }
  	end
  	assert_redirected_to new_user_session_path
  end

  test "should successfully create post when logged in" do
    sign_in @user
    content = "veo su luz"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: content, 
                                         font_color: "#ff00ff",
                                         body_color: "#cdcdcd" } }
    end
    assert_response :redirect
    follow_redirect!
    assert_template 'static_pages/home'
    assert_match content, response.body
  end

  test "should redirect edit when not logged in" do
  	get edit_post_path(@post)
  	assert_redirected_to new_user_session_path
  end

  test "should successfully get edit when logged in" do
    sign_in @user
    get edit_post_path(@post)
    assert_template 'posts/edit'
  end

  test "should redirect update when not logged in" do
  	patch post_path(@post), params: { post: { content: "somos idiotas" } }
    assert_equal @post.reload.content, @original_content
    assert_equal @post.reload.font_color, @original_font_color
    assert_equal @post.reload.body_color, @original_body_color
  	assert_redirected_to new_user_session_path
  end

  test "should successfully update post when logged in" do
    sign_in @user
    content = "somos idiotas"
    font_color = "#00ff00"
    body_color = "#ff00ff"
    patch post_path(@post), params: { post: { content: content,
                                              font_color: font_color,
                                              body_color: body_color } }
    assert_equal @post.reload.content, content
    assert_equal @post.reload.font_color, font_color
    assert_equal @post.reload.body_color, body_color
    assert_redirected_to post_path(@post)
    follow_redirect!
    assert_template 'posts/show'
    assert_not flash.empty?
    assert_match content, response.body
  end

  test "should redirect destroy when not logged in" do
  	assert_no_difference 'Post.count' do
  	  delete post_path(@post)
  	end
  	assert_redirected_to new_user_session_path
  end

  test "should successfully destroy post when logged in" do
    sign_in @user
    assert_difference 'Post.count', -1 do
      delete post_path(@post)
    end
    assert_redirected_to root_path
  end
end






