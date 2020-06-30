require 'test_helper'

class PostWithImageTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:alfonso)
  	get root_path
  end

  test "upload post with image" do
  	sign_in @user

  	content = "he sentido esta presencia antes"
  	image = fixture_file_upload('test/fixtures/yg.jpg', 'image/jpeg')
  	assert_difference 'Post.count', 1 do
  		post posts_path, params: { post: { content: content,
  								   				image: image } }
  	end
  	assert assigns(:post).image.attached?
  	assert_redirected_to root_path

  	follow_redirect!
  	assert_match content, response.body
  end
end
