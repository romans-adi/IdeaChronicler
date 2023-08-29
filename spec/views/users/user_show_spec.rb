require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  include Rails.application.routes.url_helpers
  scenario 'displays user details, bio, and recent posts' do
    user = User.create(name: 'Another Smith', photo: 'abd123', posts_counter: 10)
    post1 = user.posts.create(
      author: user,
      title: 'Hello Post',
      text: 'Hi',
      comments_counter: 0,
      likes_counter: 0
    )

    post3 = user.posts.create(
      author: user,
      title: 'Hello Kost',
      text: 'Hi Hey',
      comments_counter: 0,
      likes_counter: 0
    )

    visit user_path(user)
    puts page.html

    expect(page).to have_content(user.name)
    expect(page).to have_link(user.name, href: user_path(user))
    expect(page).to have_content("#{user.posts_counter} posts")
    expect(page).to have_link("#{user.posts_counter} posts", href: user_posts_path(user))
    expect(page).to have_content(user.bio.to_s)
    expect(page).not_to have_content(post1.title)
    expect(page).not_to have_content(post3.title)

    expect(page).to have_link('See All Posts', href: user_posts_path(user))
  end
end
