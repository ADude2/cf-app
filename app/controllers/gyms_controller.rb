class GymsController < ApplicationController
  def index
    @gyms = Gym.all
  end

  def show
    @gym = Gym.friendly.find(params[:id])
    if request.path != gym_path(@gym)
      redirect_to @gym, status: :moved_permanently
    end
    @reviews = @gym.reviews.includes(:user)
  end
end