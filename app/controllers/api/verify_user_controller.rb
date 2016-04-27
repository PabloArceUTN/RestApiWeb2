module Api
class VerifyUserController < ApplicationController
  def index
  end
  def show
  end
  def update
@user =User.find_by id: (params[:id])
@user.active=true
@user.save
redirect_to "http://localhost:9000/#/"
  end
private
def set_user
  @user = User.find(params[:id])
rescue ActiveRecord::RecordNotFound
  render json: '[{"error":"record not found"}]', status: 404
end
def verify_user_params
  params.require(:verify_user).permit(:id)
end
end
end
