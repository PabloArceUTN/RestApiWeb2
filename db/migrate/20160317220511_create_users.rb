class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :token
      t.datetime :valid_up
      t.boolean :active

      t.timestamps null: false
    end
  end
end
