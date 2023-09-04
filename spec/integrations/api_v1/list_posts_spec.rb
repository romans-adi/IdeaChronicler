require 'swagger_helper'

RSpec.describe 'API V1 Post List', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    get 'Retrieves a list of posts for a user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :string, required: true, description: 'User ID'

      response '200', 'List of posts retrieved' do
        let(:user_id) { '123' }
        run_test! do
          user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')

          Post.create(title: 'Post 1', text: 'This is post 1', author: user)
          Post.create(title: 'Post 2', text: 'This is post 2', author: user)
          Post.create(title: 'Post 3', text: 'This is post 3', author: user)

          get "/api/v1/users/#{user.id}/posts", headers: { 'Accept' => 'application/json' }

          expect(response).to have_http_status(200)
          expect(JSON.parse(response.body)).to be_an(Array)
          expect(JSON.parse(response.body).length).to eq(3)
        end
      end
    end
  end
end
