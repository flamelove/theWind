class HomeController < ApplicationController

	def index
        @posts = Post.friendly.order('created_at DESC').page params[:page]

	end

	def show
		@post = Post.friendly.find(params[:id])
		@comments = @post.comment.order('created_at DESC').page params[:page]
		# @new_comment = @post.comment.new
	end
end
