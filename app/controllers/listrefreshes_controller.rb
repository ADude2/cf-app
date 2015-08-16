class ListrefreshesController < ApplicationController
  def index
  end

  def create
    ListrefreshesWorker.perform_async(@get_list)
    redirect_to root_path
    flash[:notice] = "Gym List was refreshed."
  end

end