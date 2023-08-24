class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      flash.now[:success] = 'Comment added successfully!'
      render turbo_stream: turbo_stream.append('comments', partial: 'comments/comment', locals: { comment: @comment })
    else
      flash.now[:error] = 'Failed to add comment'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :text)
  end
end
