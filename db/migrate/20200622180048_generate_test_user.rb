class GenerateTestUser < ActiveRecord::Migration[6.0]
  def change
  	User.create! do |u|
  		u.email    = 'test@test.com'
  		u.password = 'password'
  	end
  end
end
