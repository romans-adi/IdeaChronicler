require 'swagger_helper'

RSpec.describe 'API V1 Users', type: :request do
  describe 'POST /api/v1/users' do
    it 'creates a new user' do
      post '/api/v1/users', params: { user: { email: 'newuser@example.com', password: 'password', password_confirmation: 'password' } }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'POST /api/v1/login' do
    it 'logs in a user and returns a JWT token' do
      User.create(email: 'user@example.com', password: 'password')

      post '/api/v1/login', params: { email: 'user@example.com', password: 'password' }
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to have_key('token')
    end
  end
end
