ActiveAdmin.register Product do


permit_params :title, :description, :stock_quantity, :image, :price_usd, :price_isl, :category_id, :label_id

	index do
		column :title
		column :category
		column :label
		column :created_at
		column :stock_quantity
		
		column :price_isk, :sortable => :price_isl do |product|
			number_to_currency(product.price_isl, :unit => "ISK " , :precision => 0) 
		end
		column :price_euro, :sortable => :price_usd do |product|
			number_to_currency(product.price_usd, :unit => "€ " , :precision => 0)
		end

		actions
	end

end
