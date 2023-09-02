# spec/integration/api/v1/list_comments_spec.rb
require 'swagger_helper'

describe 'List All Comments for a User\'s Post' do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    get 'Retrieves a list of comments for a user\'s post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true, description: 'User ID'
      parameter name: :post_id, in: :path, type: :string, required: true, description: 'Post ID'

      response '200', 'List of comments retrieved' do
        run_test! do
          # Create a user, a post, and comments manually for testing
          user = User.create(name: 'Test User', bio: 'Test Bio', email: 'test@example.com')
          post = Post.create(title: 'Test Post Title', text: 'Test Post Text', author: user)
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
