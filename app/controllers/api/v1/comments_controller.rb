class Api::V1::CommentsController < Api::V1::ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_comment, only: %i[show update destroy]

  def index
    @comments = Comment.where(post_id: params[:post_id])

    render json: @comments, only: %i[id text]
  end

  def show
    render json: @comment
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = @user

    if @comment.save
      render json: @comment, status: :created, location: api_v1_user_post_comment_url(@user, @post, @comment)
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:id, :text)
  end
end
