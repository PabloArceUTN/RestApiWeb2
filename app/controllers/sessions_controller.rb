class SessionsController < ApplicationController
  def index
    render :text => "Hola esto es el login"
  end

  def logout
    render :text => "Hola esto es el logout"
  end
end
