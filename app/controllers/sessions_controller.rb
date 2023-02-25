class SessionsController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"

  def show
    authenticate_admin!
    #session w calej sesji encrypted -nie moge podmienic, cookies - bezposredni store w browser
    redirect_to root_url
  end
end