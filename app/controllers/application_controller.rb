class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :authenticate

  private
    #Authenticate bring a chance to check the user validation token.
    #def @auth = false
    #def @pass = nil
    def authenticate
      #render :text => params
      #@product = '[{"mytoken":"'+params[:token]+'"}]'
      if !User.find_by(token: params[:token])
        render json: '[{"error":"Unauthorized"}]', status: 401
      end
    end
end
