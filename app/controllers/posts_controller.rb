class PostsController < ApplicationController
  before_action :move_to_sing_in, except: [:index]

  def index
  end

  def move_to_sing_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
