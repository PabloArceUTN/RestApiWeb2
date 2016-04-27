class AddColumnToTransferss < ActiveRecord::Migration
  def change
    add_column :transfers, :product_req_name, :string
              add_column :transfers, :product_offer_name, :string
  end
end
