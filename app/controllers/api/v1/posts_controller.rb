module Api
  module V1
    class PostsController < ApplicationController
      def index
        @user = User.includes(:posts).find(params[:user_id])

        respond_to do |format|
          format.json { render json: @user.posts }
        end
      end
    end
  end
end
