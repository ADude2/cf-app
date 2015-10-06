class ListrefreshesController < ApplicationController
  before_filter :verify_is_admin

  def index
  end

  def create
    ListrefreshesWorker.perform_async(@get_list)
    redirect_to root_path
    flash[:notice] = "Gym List was refreshed."
  end

  private

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
end