class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(author_id: current_user.id)
    @post.update_likes_counter
    redirect_back(fallback_location: root_path)
  end
end
