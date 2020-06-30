require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
  	@user = users(:alfonso)
  end

  test "layout links if no one logged in" do
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select 'a[href=?]', new_user_session_path
  	assert_template partial: 'posts/_post'
  	assert_template partial: 'layouts/_header'
  	assert_template partial: 'layouts/_footer'
  end
  
  test "layout links if user logged in" do
  	sign_in @user
  	get root_path
  	assert_template 'static_pages/home'
  	assert_select 'a[href=?]', new_user_session_path, count: 0
  	assert_select 'a[href=?]', root_path
  	assert_select 'a[href=?]', edit_setting_path

  	assert_template partial: 'posts/_post'
  	assert_template partial: 'layouts/_header'
  	assert_template partial: 'layouts/_footer'
  end
end
