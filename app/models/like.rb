class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  validates :author_id, uniqueness: { scope: :post_id }

  after_create :increment_post_likes_counter
  before_destroy :decrement_post_likes_counter

  private

  def increment_post_likes_counter
    post.increment!(:likes_counter)
  end

  def decrement_post_likes_counter
    post.decrement!(:likes_counter)
  end
end
