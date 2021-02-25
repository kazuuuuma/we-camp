class FavoritesController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!

  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)  
  end

  def create
    if @post.user_id != current_user.id
      favorite = current_user.favorites.build(post_id: params[:post_id])
      favorite.save
    end
  end

  def destroy
    #@favorite = Favorite.find(params[:id])
    @favorite = Favorite.find_by(id: params[:id], user_id: current_user.id, post_id: params[:post_id])
    @favorite.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
