class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_create :update_user_posts_counter
  before_destroy :update_user_posts_counter_before_destroy

  def update_user_posts_counter
    user.increment!(:posts_counter)
  end

  def update_user_posts_counter_before_destroy
    user.decrement!(:posts_counter)
  end

  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
