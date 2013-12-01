class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :vehicle_locations, :stations

  include TheRoleController

  protect_from_forgery with: :exception
  before_filter :require_login

  protected
  def not_authenticated
    redirect_to login_path, :alert => "Please login first."
  end

  def access_denied
    redirect_back_or_to(:root, :alert => 'Access denied, incorrect role')
  end

  alias_method :login_required,     :require_login
  alias_method :role_access_denied, :access_denied

  def role_params
    params.require(:role).permit(:role)
  end

  def vehicle_locations
    Location.where(:vehicle => true).order(:name).pluck(:name)
  end

  def stations
    Location.where(:vehicle => false).order(:name).pluck(:name)
  end

  def categories
    Category.pluck(:category)
  end

end
