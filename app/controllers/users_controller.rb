class UsersController < ApplicationController

  def index
    @users = User.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author_id: @user.id)
  end
end
