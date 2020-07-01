require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  def setup
  	@setting = settings(:one)
  end

  test "should be valid" do
  	assert @setting.valid?
  end

  test "should reject color if it's not in hex format" do
  	@setting.color = "fuchsia"
  	assert_not @setting.valid?
  end
end
