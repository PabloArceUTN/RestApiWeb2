class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :user, index: true
      t.string :name
      t.string :description
      t.boolean :state
      t.boolean :active

      t.timestamps
    end
  end
end
