require 'rails_helper'

RSpec.feature 'User likes a post', type: :feature, js: true do
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

  scenario 'interacts with the like button' do
    visit user_post_path(user, post)
    interact_with_like_button

    within('.post-details-container') do
      validate_like_count(1)
    end
  end

  def interact_with_like_button
    within('#like-button') do
      expect(page).not_to have_css('.liked')
      find('.heart-icon').click
      expect(page).to have_css('.liked')
    end
  end

  def validate_like_count(expected_count)
    like_count_text = find('#likes-count').text
    like_count = like_count_text.match(/\d+/)[0].to_i
    expect(like_count).to eq(expected_count)
  end
end
