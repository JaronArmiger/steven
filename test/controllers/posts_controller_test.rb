require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@post = posts(:one)
  end



  test "should redirect create when not logged in" do
  	assert_no_difference 'Post.count' do
  	  post posts_path params: { post: { content: "somos idiotas" } }
  	end
  	assert_redirected_to new_user_session_path
  end

  test "should redirect edit when not logged in" do
  	get edit_post_path(@post)
  	assert_redirected_to new_user_session_path
  end

  test "should redirect update when not logged in" do
  	assert_no_difference 'Post.count' do
  	  patch post_path(@post), params: { post: { content: "somos idiotas" } }
  	end
  	assert_redirected_to new_user_session_path
  end

  test "should redirect destroy when not logged in" do
  	assert_no_difference 'Post.count' do
  	  delete post_path(@post)
  	end
  	assert_redirected_to new_user_session_path
  end
end
