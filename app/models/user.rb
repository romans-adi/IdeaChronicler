class User < ApplicationRecord
  before_save :set_truncated_name
  before_create :set_default_role

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable

  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id

  ROLES = %w[user admin].freeze

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  private

  def set_truncated_name
    self.name = email.split('@').first.capitalize if name.blank? && email.present?
  end

  def set_default_role
    self.role ||= 'user'
  end
end
