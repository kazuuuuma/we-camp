class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def index
    #@favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    favorite_posts = Favorite.where(user_id: current_user.id).order(created_at: :desc)
    @favorite_posts = favorite_posts
  end

  def create
    if @post.user_id != current_user.id
      @favorite = Favorite.create(user_id: current_user.id, post_id: @post.id)
      @favorite.save
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    @favorite.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
