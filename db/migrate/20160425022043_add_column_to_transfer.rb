class AddColumnToTransfer < ActiveRecord::Migration
  def change
       add_column :transfers, :user_id, :integer
       add_foreign_key :transfers, :users, column: :user_id
  end
end
