class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user, foreign_key: 'author_id'
  validates :title, presence: true
  validates :text, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_comments_counter
    self.comments_counter = Comment.where(post_id: id).count
    save
  end

  def update_likes_counter
    self.likes_counter = Like.where(post_id: id).count
    save
  end

  def most_recent_comments
    Comment.includes(:user).where(post_id: id).last(5)
  end
end
