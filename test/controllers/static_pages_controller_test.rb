require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:alfonso)
  end

  test "should get home page without post form when no user signed in" do
  	get root_path
  	assert_response :success
  	assert_template 'static_pages/home'
  	assert_template partial: 'posts/_post'
  	assert_template partial: 'posts/_post_form', count: 0
  end

  test "should get home page with post form when user signed in" do
  	sign_in @user
  	get root_path
  	assert_response :success
  	assert_template 'static_pages/home'
  	assert_template partial: 'posts/_post'
  	assert_template partial: 'posts/_post_form'
  end
end
