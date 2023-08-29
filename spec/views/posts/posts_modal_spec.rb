require 'rails_helper'

RSpec.feature 'Posts Modal', type: :feature, js: true do
  let(:user) { User.create(name: 'Vilis', photo: 'abd123', posts_counter: 23) }
  let(:new_post_link_selector) { "a[data-action='click->modal#toggleModal']" }

  before do
    visit user_posts_path(user)
    find(new_post_link_selector, wait: 10).click
  end

  scenario 'User opens the modal to create a new post' do
    expect(page).to have_content('New Post')
    expect(page).to have_field('Title')
    expect(page).to have_field('Text')
    expect(page).to have_button('Create Post')
  end

  scenario 'User cancels creating a new post' do
    close_button_selector = 'button[data-action="click->modal#close"]'
    find(close_button_selector).click
  end

  scenario 'User creates a new post using the modal' do
    within('#post_form') do
      fill_in 'Title', with: 'New Post Title'
      fill_in 'Text', with: 'This is a new post'
      click_button 'Create Post'
    end

    expect(page).to have_content('New Post Title')
    expect(page).to have_content('This is a new post')
  end
end
