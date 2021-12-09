class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @comments = Comment.where(post_id: @post.id)
  end

  def create
    @user = current_user
    new_post = Post.new
    new_post.author_id = current_user.id
    new_post.title = params[:title]
    new_post.text = params[:text]
    new_post.update_comments_counter
    new_post.update_likes_counter
    new_post.save
    @user.update_posts_counter
    redirect_back(fallback_location: root_path)
  end
end
