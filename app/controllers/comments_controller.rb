class CommentsController < ApplicationController
  before_action :find_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user

    if @comment.save
      flash[:success] = 'Comment was successfully added!'
    else
      flash.now[:error] = 'Failed to add comment'
    end
    redirect_to user_post_path(params[:user_id], params[:post_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment

    if @comment.destroy
      flash[:notice] = "Comment was successfully deleted."
    else
      flash[:error] = "Failed to delete the comment."
    end

    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
