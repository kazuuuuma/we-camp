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
      @post.favorite(current_user)
      @post.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
    #item = Favorite.find(params[:id])
    #render json: { favorite: item }
  end

  def destroy
    @post = Favorite.find(params[:id]).post
    if @post.user_id != current_user.id
      @post.unfavorite(current_user)
      @post.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
