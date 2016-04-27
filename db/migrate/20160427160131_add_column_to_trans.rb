class AddColumnToTrans < ActiveRecord::Migration
  def change
      add_column :transfers, :to_whom, :string
  end
end
