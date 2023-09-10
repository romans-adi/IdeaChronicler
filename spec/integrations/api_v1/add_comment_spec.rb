require 'swagger_helper'

RSpec.describe 'Add a Comment to a Post', type: :request do
  let(:user_id) { 2 }
  let(:user) { User.create(id: 2, name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:article) { Post.create(id: 2, title: 'Post 1', text: 'This is post 1', author_id: user_id) }
  let(:post_id) { article.id }
  let(:comment) { { text: 'Your comment text here' } }

  before do
    allow_any_instance_of(Api::V1::CommentsController).to receive(:current_user).and_return(user)
  end

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
          comment_params = { text: 'Your comment text here' }
          post "/api/v1/users/#{user_id}/posts/#{post_id}/comments",
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
