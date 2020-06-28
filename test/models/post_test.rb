require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@user = users(:alfonso)
  	@post = @user.posts.build(content: "busco la luz")
  end

  test "should be valid" do
  	assert @post.valid?
  end

  test "user id should be present" do
  	@post.user_id = nil
  	assert_not @post.valid?
  end

  test "font color should be in hex format" do
  	@post.font_color = "blue"
  	assert_not @post.valid?
  end

  test "body color should be in hex format" do
  	@post.body_color = "blue"
  	assert_not @post.valid?
  end
end
