require 'rails_helper'

RSpec.feature 'User comments on a post', type: :feature, js: true do
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

  before { visit user_post_path(user, post) }

  scenario 'opens and closes comment modal' do
    open_comment_modal
    expect(find('input[type="submit"][value="Add Comment"]')).to be_present

    within('#custom-comment-modal') { click_button 'Cancel' }
  end

  scenario 'creates a new comment using the modal' do
    open_comment_modal

    within('#custom-comment-modal') do
      fill_in 'Message', with: 'This is a new comment'
      click_button 'Add Comment'
    end

    expect(page).to have_content('This is a new comment')
  end

  def open_comment_modal
    find("a[data-action='click->comment-modal#toggleCommentModal']").click
  end
end
