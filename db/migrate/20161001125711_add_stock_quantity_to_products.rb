class AddStockQuantityToProducts < ActiveRecord::Migration
  def change
  	  add_column :products, :stock_quantity, :integer
  end
end
