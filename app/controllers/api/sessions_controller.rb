module Api
class SessionsController < ApplicationController
  def index
    user = User.find_by(username: params[:username])
    #check for an existent user and execute the password authentication
    if user && user.authenticate(params[:password])
      user.update_attribute(:valid_up, DateTime.now + 30.minutes)
      #30.minutes.from_now.to_s
      render json: "{\"token\": \"#{user.token}\"}", status: 200
    else
      render json: '{"error":"Submited information does not match"}', status: 422
    end
  end

  def logout
    user1 = User.find_by(token: params[:token])
    if user1
      @new_token = User.get_new_token
      user1.update_attribute(:token, @new_token )
      render json: '{"message": "Successful logout"}', status: 200
    else
      render json: '{"error": "Unknown Token"}', status: 422
    end
  end
end
end
