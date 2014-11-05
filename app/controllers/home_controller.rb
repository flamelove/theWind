class HomeController < ApplicationController

	def index
        @posts = Post.order('created_at DESC').page params[:page]
		 # @posts = current_user.post.page params[:page]
	end

	def show
		@post=Post.find(params[:id])
	end
end
