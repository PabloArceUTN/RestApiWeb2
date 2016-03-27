class SessionsController < ApplicationController
  def index
    user = User.find_by(username: params[:username])
    #check for an existent user and execute the password authentication
    if user && user.authenticate(params[:password])
      user.update_attribute(:valid_up, DateTime.now + 30.minutes)
      render json: "[{\"token\": \"#{user.token}\"}]", status: 200
    else
      render json: '[{"error":"Submited information does not match"}]'
    end
  end

  def logout
    user = User.find_by(username: params[:username])
    @new_token = User.get_new_token
    user.update_attribute(:token, @new_token )
  render :text => @new_toke
  end
end
