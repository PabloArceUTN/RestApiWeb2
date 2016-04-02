module Api
class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfer = Transfer.all
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
    if params[:token]
    transfer = Transfer.new()
    transfer.product_req_id = (params[:product_req_id])
    transfer.product_offer_id = (params[:product_offer_id])
    transfer.active = (params[:active])
    if transfer.save
     render json: '[{"message":"The transfer was Created"}]', status: :ok
   else
     render json: transfer.errors, status: :unprocessable_entity
   end
 else
       render json: '[{"error":"Unauthorized"}]', status: 401
 end
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    transfer = Transfer.find_by id: (params[:id])
    transfer.product_req_id = (params[:product_req_id])
    transfer.product_offer_id = (params[:product_offer_id])
    transfer.active = (params[:active])
    if transfer.save
      render json: '[{"message":"The Transfer was Updated"}]', status: :ok
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @transfer.destroy
      render json: '[{"message":"The transfer was Deleted"}]', status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:product_req_id, :product_offer_id, :active)
    end
end
end
