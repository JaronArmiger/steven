require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@setting = settings(:one)
    get root_path # this sets the setting color and id in the session
  	@original_color = @setting.color
  	@user = users(:alfonso)
  end

  test "should redirect edit when not logged in" do
  	get edit_setting_path(@setting)
  	assert_redirected_to new_user_session_path
  end
  
  test "should not redirect edit when logged in" do
  	sign_in @user
  	get edit_setting_path(@setting)
  	assert_select "input[type=?]", 'color'
  	assert_select "input[value=?]", "Save Changes"
  end

  test "should redirect update when not logged in" do
  	patch setting_path(@setting), params: {setting: { color: "#abcdef"} }
  	assert_equal @setting.reload.color, @original_color
  	assert_redirected_to new_user_session_path
  end

  test "should update successfully when logged in" do
  	sign_in @user
  	patch setting_path(@setting), params: {setting: { color: "#abcdef"} }
  	assert_equal  @setting.reload.color, "#abcdef"
  	assert_response :redirect
  	assert_redirected_to root_path
  end
end
