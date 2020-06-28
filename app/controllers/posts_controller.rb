class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def create
		@post = current_user.posts.build(post_params)
		@post.image.attach(params[:post][:image])
		if @post.save
			flash[:success] = "post created!"
			redirect_to root_url
		else
			render 'static_pages/home'
			@feed_items = Post.all
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = current_user.posts.find_by(id: params[:id])
		@post.destroy
		flash[:success] = "Post destroyed :)"
		redirect_to root_url
	end

	private

		def post_params
			params.require(:post).permit(:content, :image, :font_color, :body_color)
		end
end
