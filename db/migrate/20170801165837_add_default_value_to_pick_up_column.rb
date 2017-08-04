class AddDefaultValueToPickUpColumn < ActiveRecord::Migration
  def change
  	change_column :orders, :pick_up, :boolean, default: false
  end
end
