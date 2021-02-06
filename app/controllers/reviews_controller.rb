class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to post_path(@review.post)
    else
      render "posts/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :visit_day, :image).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
