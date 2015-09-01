class ReviewsController < ApplicationController
  before_action :set_gym

  def new
    @review = Review.new
  end

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

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update_attributes(review_params)
      flash[:notice] = "Your review was succesfully updated."
      redirect_to @gym
    else
      flash[:error] = "Error updating your review. Please try again."
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])

    if @review.destroy
      flash[:notice] = "Your review was succesfully removed."
      redirect_to @gym
    else
      flash[:error] = "Error removing your review. Please try again."
      redirect_to @gym
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
