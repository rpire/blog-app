class UsersController < ApplicationController
  def index
    @users = User.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(author_id: @user.id)
  end

  def create
    new_user = User.new
    new_user.name = params[:name]
    new_user.photo = params[:photo]
    new_user.bio = params[:bio]
    new_user.update_posts_counter
    @new_user = new_user.save
    if @new_user
      flash[:notice] = 'New user created!'
    else
      flash[:alert] = new_user.errors.full_messages.first
    end
    redirect_to root_path
  end
end
