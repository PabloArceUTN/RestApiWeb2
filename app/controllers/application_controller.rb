
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
    #render :text => params[:action]
    if (params[:controller] != "api/sessions")
      if (params[:controller] == "api/users" && params[:action] == "create")
        return
      end
      user = User.find_by(token: params[:token])
      if !user || user.valid_up < DateTime.now
        render json: '{"error":"Unauthorized"}', status: 401
      end
    end
    if (params[:controller] == "api/sessions" && params[:action] == "chekToken")
      user = User.find_by(token: params[:token])
      if !user || user.valid_up < DateTime.now
        render json: '{"error":"Unauthorized"}', status: 401
      end
    end
    #"controller":"users","action":"show","id":"login" si se va a registrar dejar pasar
    #@product = '[{"mytoken":"'+params[:token]+'"}]'
    # if !User.find_by(token: params[:token])
    #   #render json: '[{"error":"Unauthorized"}]', status: 401
    # end
  end
end
