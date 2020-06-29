class UsersController < ApplicationController
	def edit_color
		render 'users/edit_color'
	end

	def update_color
		current_user.color = params[:color]
		current_user.save
		redirect_to root_url
	end
end
