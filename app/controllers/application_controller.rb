class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

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

  def set_categories
    @categories = Category.pluck(:name)
    @categories.unshift('all')
    @stations = Station.pluck(:name)
    @apparatus = Vehicle.pluck(:name)
    @locations = Location.pluck(:name)
  end

  helper_method :set_categories
end
