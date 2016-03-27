class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    #@products = Product.where(:active => true).all
    render json: Product.where(:active => true).all, status: :ok
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
   render json: @product, status: :ok
  end

  # GET /products/new
  def new
    @product = Product.new
  end
  #Session Management Section
  def login
    render json: User.where(:active => true).all, status: :ok
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
     product = Product.new()
     product.name = (params[:name])
     product.description = (params[:description])
     product.active = (params[:active])
     product.user_id = (params[:user_id])
     if product.save
      render json: 'The product was Created', status: :ok
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    product = Product.find_by id: (params[:id])
    product.name = (params[:name])
    product.description = (params[:description])
    product.active = (params[:active])
    product.user_id = (params[:user_id])
    if product.save
      render json: 'The product was Updated', status: :ok
    else
      render json: product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
      render json: 'The product was Deleted', status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :active, :user_id)
    end
end
