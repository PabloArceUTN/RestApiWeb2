class AddColumnToProducts < ActiveRecord::Migration
  def change
      add_column :products, :url_img, :string
  end
end
