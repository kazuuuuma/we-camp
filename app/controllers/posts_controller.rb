class PostsController < ApplicationController
  before_action :move_to_sing_in, except: [:index]
  before_action :move_to_index, only: [:edit]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
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
end
