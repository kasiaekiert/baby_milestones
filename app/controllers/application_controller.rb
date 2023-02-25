class ApplicationController < ActionController::Base
  
  protected
  def admin?

  end

  def authenticate_admin!
    session[:admin] = true
  end
end
