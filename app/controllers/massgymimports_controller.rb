class MassgymimportsController < ApplicationController
  before_filter :verify_is_admin

  def index
  end

  def create
    MassgymimportsWorker.perform_async(@import_all)
    redirect_to root_path
    flash[:notice] = "Gym Database is being created. Stand by."
  end

  private

  def verify_is_admin
    (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
  end
end