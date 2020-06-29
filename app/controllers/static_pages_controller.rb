class StaticPagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home]
	def home
		@main_user = User.first
		@post = @main_user.posts.build
		session[:site_color] = Setting.first.color
		@feed_items = Post.order('created_at DESC')
	end
end
