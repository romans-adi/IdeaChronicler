module Api
  module V1
    class PostsController < ApplicationController
      before_action :find_user

      def index
        @posts = @user.posts.includes(:comments, :likes).paginate(page: params[:page], per_page: 5)
        render json: @posts, include: %i[comments likes]
      end
    end
  end
end
