class SettingsController < ApplicationController
	def edit
		@setting = Setting.first
	end

	def update
		setting = Setting.find(params[:id])
		setting.color = params[:setting][:color]
		if setting.save
			flash[:success] = "site color updated!"
			redirect_to root_path
		else
			render :edit
		end
	end
end