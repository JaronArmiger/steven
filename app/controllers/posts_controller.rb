class PostsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:show]
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
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

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		if @post.save
			flash[:success] = "post updated"
			redirect_to post_path(@post)
		else
			render :edit
		end
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
