class ChangeLabelName < ActiveRecord::Migration
  def change
  	rename_column :labels, :label_name, :name
  end
end
