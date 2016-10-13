class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :orders, :send, :delivery
  end
end
