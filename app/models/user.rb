class User < ApplicationRecord
  has_many :posts

  def most_recent_posts
    Post.where(author_id: id).last(3)
  end

  def update_posts_counter
    self.posts_counter = Post.where(author_id: id).count
    save
  end
end
