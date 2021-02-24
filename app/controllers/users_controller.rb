class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts

    @favorite_posts = @user.favorites_posts
  end

  private

  def user_params
    params.require(:users).permit(:email, :nickname, :familyname, :firstname, :profile)
  end
end
