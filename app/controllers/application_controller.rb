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
    return render(text: 'access_denied: requires a role')
  end

  alias_method :login_required,     :require_login
  alias_method :role_access_denied, :access_denied

end
