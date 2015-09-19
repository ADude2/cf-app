class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    @my_reviews = @user.reviews.includes(:gym).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end
end