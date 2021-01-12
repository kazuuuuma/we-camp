class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:users).permit(:email, :nickname, :familyname, :firstname, :profile)
  end
end
