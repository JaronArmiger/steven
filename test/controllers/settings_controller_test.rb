require 'test_helper'

class SettingsControllerTest < ActionDispatch::IntegrationTest
  def setup
  	@setting = settings(:one)
  end

  test "should redirect edit when not logged in" do
  	get edit_setting_path(@setting)
  	assert_redirected_to new_user_session_path
  end
end
