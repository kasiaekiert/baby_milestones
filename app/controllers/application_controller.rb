class ApplicationController < ActionController::Base
  helper_method :admin?

  protected
  def admin?
    session[:admin]
  end

  def authenticate_admin!
    session[:admin] = true
  end
end
