require 'rails_helper'

RSpec.feature 'User index page', type: :feature do
  context 'displaying user information' do
    let!(:user1) { User.create(name: 'Vilis', photo: 'abd123', posts_counter: 23) }
    let!(:user2) { User.create(name: 'Another Smith', photo: 'abd123', posts_counter: 10) }

    before do
      visit users_path
    end

    it 'displays usernames and post counts' do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user2.name)
      expect(page).to have_content("#{user1.posts_counter} posts")
      expect(page).to have_content("#{user2.posts_counter} posts")
    end

    it 'provides links to user show pages' do
      expect(page).to have_link(user1.name, href: user_path(user1))
      expect(page).to have_link(user2.name, href: user_path(user2))
    end

    it 'provides links to user post index pages' do
      expect(page).to have_link("#{user1.posts_counter} posts", href: user_posts_path(user1))
      expect(page).to have_link("#{user2.posts_counter} posts", href: user_posts_path(user2))
    end
  end
end
