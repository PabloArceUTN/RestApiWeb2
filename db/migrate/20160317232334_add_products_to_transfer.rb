class AddProductsToTransfer < ActiveRecord::Migration
  def change
    add_foreign_key :transfers, :products, column: :product_req_id
    add_foreign_key :transfers, :products, column: :product_offer_id
  end
end
