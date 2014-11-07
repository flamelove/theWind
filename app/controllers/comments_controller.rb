class CommentsController < ApplicationController
	before_action :authenticate_user!
  respond_to :html, :xml, :json

  # def self.when_to_run
  #   2.hours.from_now
  # end

  # handle_asynchronously :call_a_class_method, :run_at => Proc.new { when_to_run }
	def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @post.comment.create(comment_params)
    @comment.user_id = current_user.id #or whatever is you session name
    if @comment.save
        respond_to do |format|
         format.json { render json: @comment.as_json(include: [:user])}
        end
        if @post.user!=current_user 
          PostMail.delay.notication_email(@comment)
      end
      else
        format.json { render json: @post.errors, status: :unprocessable_entity }
        flash.now[:danger] = "error"
      end
  end
 
  private
    def comment_params
      params.require(:comment).permit(:content,:user_id, :post_id)
    end
end
