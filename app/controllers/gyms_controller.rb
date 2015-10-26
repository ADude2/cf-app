class GymsController < ApplicationController
  def index
    if params[:search].present?
      @search = params[:search]
      @gyms = Gym.search_any_word(@search).includes(:reviews).paginate(page: params[:page], per_page: 10)
      @gym_count = @gyms.count
    else
      flash[:alert] = "Please specify a search term"
      redirect_to root_path
    end
  end

  def show
    @gym = Gym.friendly.find(params[:id])
    if request.path != gym_path(@gym)
      redirect_to @gym, status: :moved_permanently
    end
    @reviews = @gym.reviews.includes(:user).paginate(page: params[:page], per_page: 10)
    @review_count = @gym.reviews.count
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end
end