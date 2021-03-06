class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  before_action :authenticate_user!
  # load_and_authorize_resource
  def index
    @posts = current_user.post.order('created_at DESC').page params[:page]
    respond_with(@posts)
  end

  def show
    authorize! :read, @post
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
   #  @post = Post.new(post_params)
   # @post.user=current_user
    @post = current_user.post.build(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :content,:images,:images_cache)
    end
end
