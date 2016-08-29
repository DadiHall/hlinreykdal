class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :image
      t.text :description
      t.decimal :price_usd
      t.decimal :price_isl

      t.timestamps null: false
    end
  end
end
