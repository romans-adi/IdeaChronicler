module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]

      def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
      end

      def create
        @post = Post.find(params[:post_id])
        @default_user = User.find_by(email: 'romans.spilaks@gmail.com')
        @default_user ||= User.create(email: 'romans.spilaks@gmail.com', password: '123456')
        @comment = @post.comments.new(comment_params)
        @comment.author = @default_user

        if @comment.save
          render json: @comment, status: :created
        else
          logger.error(@comment.errors.full_messages.join(", "))
          render json: { error: 'Failed to add comment' }, status: :unprocessable_entity
        end
      end

      def comment_params
        params.require(:comment).permit(:text, :author)
      end
    end
  end
end
