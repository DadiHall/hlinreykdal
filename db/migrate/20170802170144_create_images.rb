class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :image_file_name
      t.integer :image_file_size
      t.string :image_content_type

      t.timestamps null: false
    end
  end
end
