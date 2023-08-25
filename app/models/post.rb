class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_create :update_user_posts_counter
  before_destroy :update_user_posts_counter_before_destroy

  def update_user_posts_counter
    author.increment!(:posts_counter)
  end

  def update_user_posts_counter_before_destroy
    author.decrement!(:posts_counter)
  end

  def self.recent_posts(limit = 5)
    order(created_at: :desc).limit(limit)
  end

  def liked?(user)
    !!likes.find { |like| like.author_id == user.id }
  end
end
