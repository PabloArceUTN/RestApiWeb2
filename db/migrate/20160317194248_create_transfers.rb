class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.references :product_req, index: true
      t.references :product_offer, index: true
      t.boolean :active

      t.timestamps
    end
  end
end
