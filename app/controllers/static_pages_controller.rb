class StaticPagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home]
	def home
		@main_user = User.first
		@post = user.posts.build
		@feed_items = Post.all
	end
end
