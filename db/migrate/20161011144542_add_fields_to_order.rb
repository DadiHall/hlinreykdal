class AddFieldsToOrder < ActiveRecord::Migration
  def change
  	add_column :orders, :pick_up, :string
  	add_column :orders, :send, :string
  end
end
