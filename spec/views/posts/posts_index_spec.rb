require 'rails_helper'

RSpec.feature 'User Posts', type: :feature, js: true do
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

  scenario 'User opens and closes the modal' do
    visit user_posts_path(user)

    new_post_link_selector = "a[data-action='click->modal#toggleModal']"
    find(new_post_link_selector, wait: 10).click

    expect(page).to have_content('New Post')

    close_button_selector = 'button[data-action="click->modal#close"]'
    find(close_button_selector).click
  end

  scenario 'User views posts on the index page' do
    visit user_posts_path(user)

    expect(page).to have_content("Post ##{post.id}")
    expect(page).to have_content(post.text)
    expect(page).to have_content("Likes: #{post.likes_counter}")
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end
end
