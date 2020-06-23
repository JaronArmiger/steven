class StaticPagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home]
	def home
		@main_user = User.first
		@post = @main_user.posts.build
		@feed_items = Post.order('created_at DESC')
	end
end
