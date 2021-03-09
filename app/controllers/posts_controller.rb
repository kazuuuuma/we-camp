class PostsController < ApplicationController
  before_action :move_to_sing_in, except: [:index, :show, :search, :prefecture]
  before_action :move_to_index, only: [:edit]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes([:user, :favorites]).order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @review = Review.new
    @reviews = @post.reviews.includes(:user)
    #results = Geocoder.search(params[:address])
    #@latlng = results.first.coordinates
  end

  def edit
    
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def favorites
    #@favorite = Favorite.find(params[:id])
    @favorite_posts = current_user.favorite_posts.includes(:user).order(created_at: :desc)
  end

  def prefecture
    @place = Place.find(params[:place_id])
    @posts = Post.prefecture(params[:place_id]).order("created_at DESC")
  end

  private

  def move_to_sing_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    unless current_user.id == @post.user_id
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:campsite, :text, :place_id, :toilet_id, :water_id, :fire_id, :gomi_id, :river_id, :price, :image, :favorite_count, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
