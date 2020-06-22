class StaticPagesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:home]
	def home
		@post = current_user.posts.build
		@feed_items = Post.all
	end
end
