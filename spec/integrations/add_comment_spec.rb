# spec/integration/api/v1/add_comment_spec.rb
require 'swagger_helper'

describe 'Add a Comment to a Post' do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    post 'Creates a new comment for a user\'s post' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true, description: 'User ID'
      parameter name: :post_id, in: :path, type: :string, required: true, description: 'Post ID'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: ['text']
      }

      response '201', 'Comment created' do
        run_test! do
          # Create a user and a post manually for testing
          user = User.create(name: 'Test User', bio: 'Test Bio', email: 'test@example.com')
          post = Post.create(title: 'Test Post Title', text: 'Test Post Text', author: user)

          # Create a comment manually for testing
          comment_params = { text: 'Your comment text here' }
          post "/api/v1/users/#{user.id}/posts/#{post.id}/comments",
               params: { comment: comment_params }.to_json,
               headers: {
                 'Content-Type' => 'application/json',
                 'Accept' => 'application/json'
               }

          expect(response).to have_http_status(201)
          expect(JSON.parse(response.body)).to include('text' => 'Your comment text here')
        end
      end
    end
  end
end
