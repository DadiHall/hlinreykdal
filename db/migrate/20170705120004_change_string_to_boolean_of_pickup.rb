class ChangeStringToBooleanOfPickup < ActiveRecord::Migration
  def change
  	change_column :orders, :pick_up, 'boolean USING CAST(pick_up AS boolean)'
  end
end
