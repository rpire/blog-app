class User < ApplicationRecord
  has_many :posts
  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def most_recent_posts
    Post.where(author_id: id).last(3)
  end

  def update_posts_counter
    self.posts_counter = Post.where(author_id: id).count
    save
  end
end
