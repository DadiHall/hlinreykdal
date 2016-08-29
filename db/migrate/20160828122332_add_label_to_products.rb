class AddLabelToProducts < ActiveRecord::Migration
   def change
  	label = Label.create! label_name: "No Label"

    add_reference :products, :label, index: true, foreign_key: true, default: label.id

  end
end
