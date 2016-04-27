module Api
  class TransfersController < ApplicationController
    before_action :set_transfer, only: [:show, :edit, :update, :destroy]

    # GET /transfers
    # GET /transfers.json
    def index
          @user = User.find_by(token: params[:token])
      @transfer = Transfer.where(:user_id => @user.id , :active => true , :state => "pending").all
       @d= 0

      while @d < @transfer.size  do
        @transfer[@d].product_offer_name = Product.find(@transfer[@d].product_offer_id).name
        @transfer[@d].product_req_name = Product.find(@transfer[@d].product_req_id).name
        @transfer[@d].to_whom = Product.find(@transfer[@d].product_req_id).user_id
        @d = @d + 1
      end

      render json: @transfer, status: :ok
    end

    # GET /transfers/1
    # GET /transfers/1.json
    def show
      @transfer = Transfer.find(params[:id])
      render json: @transfer, status: :ok
    end

    # GET /transfers/new
    def new
      @transfer = Transfer.new
    end

    # GET /transfers/1/edit
    def edit
    end

    # POST /transfers
    # POST /transfers.json
    def create
      transfer = Transfer.new()
      transfer.product_req_id = (params[:product_req_id])
      transfer.product_offer_id = (params[:product_offer_id])
      transfer.user_id = (params[:user_id])
      transfer.active = true
      transfer.state ="pending"
      if transfer.save
        render json: '[{"message":"The transfer was Created"}]', status: :ok
      else
        render json: transfer.errors, status: :unprocessable_entity
      end
    rescue  ActiveRecord::InvalidForeignKey
      render json: '[{"error":"No valid foreign keys asignation"}]', status: 422
    end
 # def changeState
 #  transfer = Transfer.find(1)
 #  transfer.state = "finished"
 #  @userOne=Product.find(:id => 4 )
 #  @userTwo=Product.find(:id => 3 )
 #  userOne.user_id = @userTwo.id
 #  userOne.save
 #  userTwo.user_id = @userOne.id
 #  userTwo.save
 #    transfer.save
 # end
    # PATCH/PUT /transfers/1
    # PATCH/PUT /transfers/1.json
    def update
      transfer =Transfer.find_by id: (params[:id])
      transfer.state = "finished"
      @userOne=Product.find(params[:product_offer_id])
      @userTwo=Product.find(params[:product_req_id])
      @x=@userOne.user_id
      @userOne.user_id = @userTwo.user_id
      @userTwo.user_id = @x
      @userOne.save
      @userTwo.save
        transfer.save


      # transfer = Transfer.find_by id: (params[:id])
      # transfer.product_req_id = (params[:product_req_id])
      # transfer.product_offer_id = (params[:product_offer_id])
      # transfer.active = (params[:active])
      # if transfer.save
      #   render json: '[{"message":"The Transfer was Updated"}]', status: :ok
      # else
      #   render json: product.errors, status: :unprocessable_entity
      # end
    # rescue  ActiveRecord::InvalidForeignKey
       render json: '[{"message":"transfer succesfull"}]', status: ok
    end

    # DELETE /transfers/1
    # DELETE /transfers/1.json
    def destroy
      @transfer.destroy
      render json: '[{"message":"The transfer was Deleted"}]', status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: '[{"error":"record not found"}]', status: 404
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: '[{"error":"record not found"}]', status: 404
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:product_req_id, :product_offer_id, :active, :user_id)
    end
  end
end
