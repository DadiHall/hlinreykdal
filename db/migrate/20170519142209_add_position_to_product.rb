class AddPositionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :position, :integer

    Product.order(:updated_at).each.with_index(1) do |product, index|
      product.update_column :position, index
    end
  end
end
