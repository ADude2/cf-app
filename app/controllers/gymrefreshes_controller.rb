class GymrefreshesController < ApplicationController
  before_filter :verify_is_admin

  def index
 
  end

  def create
    @gym_id = params[:gym_id][:gym_id]
    name = @gym_id
    GymrefreshesWorker.perform_async(@gym_id)
    redirect_to root_path
    flash[:notice] = "Gym \"#{name}\" successfully created or updated."
  end

  private

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
end