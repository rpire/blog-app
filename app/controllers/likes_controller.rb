class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(author_id: current_user.id)
    @post.update_likes_counter
    flash[:notice] = 'You liked this post'
    redirect_back(fallback_location: root_path)
  end
end
