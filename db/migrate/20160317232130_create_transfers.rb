class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :product_req_id
      t.integer :product_offer_id
      t.boolean :active

      t.timestamps null: false
    end
  end
end
