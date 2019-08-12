class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    if @comment.save
      redirect_to @post,
          notice: 'Comment was successfully created.'
    else
      redirect_to @post,
          alert: 'Error creating comment.' + @comment.errors.full_messages.to_sentence
    end
  end

  def comment_params
    params.require(:comment).permit(:author, :body, :email)
  end
end
