require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  include Rails.application.routes.url_helpers

  let!(:user) { User.create(name: 'Another Smith', photo: 'abd123', posts_counter: 10) }

  it 'displays user details and recent posts' do
    visit user_path(user)
    expect(page).to have_content(user.name)
    expect(page).to have_link(user.name, href: user_path(user))
    expect(page).to have_content("#{user.posts_counter} posts")
    expect(page).to have_link("#{user.posts_counter} posts", href: user_posts_path(user))
    expect(page).to have_content(user.bio.to_s)
    expect(page).to have_link('See All Posts', href: user_posts_path(user))
  end
end
