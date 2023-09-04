require 'swagger_helper'

RSpec.describe 'List All Comments for a User\'s Post', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    get 'Retrieves a list of comments for a user\'s post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true, description: 'User ID'
      parameter name: :post_id, in: :path, type: :string, required: true, description: 'Post ID'

      response '200', 'List of comments retrieved' do
        let(:user_id) { '123' }
        let(:post_id) { '123' }
        run_test! do
          user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
          post = Post.create(title: 'Post 1', text: 'This is post 1', author: user)
          Comment.create(text: 'Test Comment 1', post:, author: user)
          Comment.create(text: 'Test Comment 2', post:, author: user)

          get "/api/v1/users/#{user.id}/posts/#{post.id}/comments", headers: { 'Accept' => 'application/json' }

          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)).to be_an(Array)
        end
      end
    end
  end
end
