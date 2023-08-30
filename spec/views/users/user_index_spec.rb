require 'rails_helper'

RSpec.feature 'User List', type: :feature do
  let!(:user1) { User.create(name: 'Vilis', photo: 'abd123', posts_counter: 23) }
  let!(:user2) { User.create(name: 'Another Smith', photo: 'abd123', posts_counter: 10) }

  context 'displaying user information' do
    before do
      visit users_path
    end

    it 'displays a list of users with their information' do
      expect(page).to have_selector('.user-list li', count: 2)

      within('.user-list') do
        expect(page).to have_content(user1.name)
        expect(page).to have_link(user1.name, href: user_path(user1))
        expect(page).to have_content("#{user1.posts_counter} posts")
        expect(page).to have_link("#{user1.posts_counter} posts", href: user_posts_path(user1))

        expect(page).to have_content(user2.name)
        expect(page).to have_link(user2.name, href: user_path(user2))
        expect(page).to have_content("#{user2.posts_counter} posts")
        expect(page).to have_link("#{user2.posts_counter} posts", href: user_posts_path(user2))
      end
    end
  end
end
