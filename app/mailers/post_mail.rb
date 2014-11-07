class PostMail < ActionMailer::Base
  default from: "thewind@nustechnology.com"

  def notication_email(comment)
  	@comment =comment
  	@host='http://localhost:3000/'
  	@url= @host+'/home/'+comment.post_id.to_s
	 mail(to:"#{@comment.post.user.username} <#{@comment.post.user.email}>", 
		 subject: 'Welcome to The wind website')

  	
  end

end
