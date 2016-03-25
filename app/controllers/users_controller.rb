class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  # Sign in
  def create
    user = User.new()
    user.username = (params[:username])
    user.password = (params[:password])
    user.firstname = (params[:firstname])
    user.active = true
    if user.save
     render json: 'The user was Created', status: :ok
   else
     render json: user.errors, status: :unprocessable_entity
   end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    user = User.find_by id: (params[:id])
    user.username = (params[:username])
    user.password = (params[:password])
    user.firstname = (params[:firstname])
   #user.token      =  (params[:token])
    user.valid_up = (params[:valid_up])
    user.active = (params[:active])
    if user.save
      render json: 'The user was Updated', status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
      render json: 'The user was Deleted', status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :firstname, :token, :valid_up, :active)
    end
end
