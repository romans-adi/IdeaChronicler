# spec/integration/api/v1/list_posts_spec.rb
require 'swagger_helper'

describe 'List All Posts for a User' do
  path '/api/v1/users/{user_id}/posts' do
    get 'Retrieves a list of posts for a user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true, description: 'User ID'

      response '200', 'List of posts retrieved' do
        run_test! do
          # Create a user and a post manually for testing
          user = User.create(name: 'Test User', bio: 'Test Bio', email: 'test@example.com')
          Post.create(title: 'Test Post Title', text: 'Test Post Text', author: user)

          get "/api/v1/users/#{user.id}/posts", headers: { 'Accept' => 'application/json' }

          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)).to be_an(Array)
        end
      end
    end
  end
end
