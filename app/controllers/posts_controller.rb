class PostsController < ApplicationController
  before_action :find_user

  def index
    @posts = @user.posts.includes(:comments).paginate(page: params[:page], per_page: 5)
    @comments = Comment.all
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comment = Comment.new
    @current_user = current_user
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new author: current_user, title: params[:title], text: params[:text], comments_counter: 0,
                     likes_counter: 0
    if @post.save
      flash[:success] = 'Post was successfully created!'
      redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
    else
      flash.now[:error] = 'Failed to create the post'
      render :new
      puts @post.errors.messages
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :author_id)
  end
end
