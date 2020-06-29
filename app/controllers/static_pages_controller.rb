class StaticPagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home]
	def home
		@main_user = User.first
		@post = @main_user.posts.build
		if Setting.count >= 1
			@setting = Setting.first
		else
			@setting = Setting.create
		end
		session[:site_color] = @setting.color
		@feed_items = Post.order('created_at DESC')
	end
end
