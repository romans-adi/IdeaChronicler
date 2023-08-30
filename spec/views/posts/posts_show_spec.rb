require 'rails_helper'

RSpec.feature 'User views post details', type: :feature, js: true do
  let!(:user) { User.create(name: 'Vilis', photo: 'abd123', posts_counter: 23) }
  let!(:post) do
    user.posts.create(
      author: user,
      title: 'Hello Post',
      text: 'Hi',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before do
    visit user_post_path(user, post)
  end

  scenario 'displays post details' do
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
    expect(page).to have_content('Romans and 0 others liked this')
    expect(page).to have_content('No comments yet')
  end
end
