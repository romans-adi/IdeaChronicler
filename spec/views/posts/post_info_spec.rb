require 'rails_helper'

RSpec.feature 'Post Info Page', type: :feature do
  let(:user) { create(:user) } # You can use FactoryBot for creating test data
  let!(:post) { create(:post, user: user) } # Assuming you have FactoryBot factories for User and Post

  before do
    visit user_post_path(user, post)
  end

  scenario 'displays post details' do
    expect(page).to have_content(post.title)
    expect(page).to have_content(post.text)
    expect(page).to have_content("Likes: #{post.likes_counter}")
    expect(page).to have_content("Comments: #{post.comments.count}")
  end

  scenario 'allows navigation back to user profile' do
    click_link 'Back to User Profile'
    expect(current_path).to eq(user_path(user))
  end
end
