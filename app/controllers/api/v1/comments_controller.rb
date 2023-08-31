module Api
  module V1
    class CommentsController < ApplicationController
      def index
        @post = Post.find(params[:post_id])
        @comments = @post.comments
        render json: @comments
      end

      def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        @comment.author = current_user

        if @comment.save
          render json: @comment, status: :created
        else
          render json: { error: 'Failed to add comment' }, status: :unprocessable_entity
        end

        private

        def comment_params
          params.require(:comment).permit(:text)
        end
      end
    end
  end
end
