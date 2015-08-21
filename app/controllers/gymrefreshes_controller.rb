class GymrefreshesController < ApplicationController
  def index
  end

  def create
    @gym_id = params[:gym_id][:gym_id]
    name = @gym_id
    GymrefreshesWorker.perform_async(@gym_id)
    redirect_to root_path
    flash[:notice] = "Gym \"#{name}\" successfully created or updated."
  end
end