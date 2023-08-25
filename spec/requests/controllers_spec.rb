require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe UsersController do
    let(:user) do
      User.create(
        name: 'John Smith',
        photo: 'https://unsplash.com/photos/abcdef',
        bio: 'Lorem lorem ipsum ipsum.',
        posts_counter: 5
      )
    end

    describe 'GET #index' do
      it 'returns a successful response' do
        get users_path
        expect(response).to have_http_status(:success)
      end

      it 'renders the index template' do
        get users_path
        expect(response).to render_template(:index)
      end

      it 'response body includes placeholder text' do
        user = User.create(
          name: 'John Smith',
          photo: 'https://unsplash.com/photos/abcdef',
          bio: 'Lorem lorem ipsum ipsum.',
          posts_counter: 5
        )

        get users_path
        expect(response.body).to include(user.name)
      end
    end

    describe 'GET #show' do
      subject { get user_path(user) }

      it 'returns a successful response' do
        subject
        expect(response).to be_successful
      end

      it 'renders the show template' do
        subject
        expect(response).to render_template(:show)
      end

      it 'includes user name in the response body' do
        subject
        expect(response.body).to include(user.name)
      end
    end
  end

  describe PostsController do
    let(:user) do
      User.create(
        name: 'Vilis',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Latvia.',
        posts_counter: 23
      )
    end

    let(:post) do
      Post.create(
        author_id: user.id,
        title: 'Hello Post',
        text: 'Hi',
        comments_counter: 0,
        likes_counter: 0
      )
    end

    describe 'GET #index' do
      subject { get user_posts_path(user) }

      it 'returns a successful response' do
        subject
        expect(response).to be_successful
      end

      it 'renders the index template' do
        subject
        expect(response).to render_template(:index)
      end

      it 'includes user name and post count in the response body' do
        user = User.create(
          name: 'Vilis',
          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
          bio: 'Teacher from Latvia.',
          posts_counter: 23
        )
        Post.create(
          author: user,
          title: 'Hello Post',
          text: 'Hi',
          comments_counter: 0,
          likes_counter: 0
        )

        get user_posts_path(user)
        expect(response.body).to include(user.name)
        expect(response.body).to include("#{user.posts.count} post")
      end
    end

    describe 'GET #show' do
      subject { get user_post_path(user, post) }

      it 'returns a successful response' do
        subject
        expect(response).to be_successful
      end

      it 'renders the show template' do
        subject
        expect(response).to render_template(:show)
      end
    end
  end
end
