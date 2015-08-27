class ReviewsController < ApplicationController
  before_action :set_gym

  def create
    @reviews = @gym.reviews
    @review = current_user.reviews.build(review_params)
    @review.gym = @gym

    if @review.save
      flash[:notice] = "Review succesfully added!"
      redirect_to @gym
    else
      flash[:error] = "Error adding your review. Please try again."
      render :new
    end
  end
  
  private

  def set_gym
    @gym = Gym.find(params[:gym_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
