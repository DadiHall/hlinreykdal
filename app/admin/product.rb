ActiveAdmin.register Product do


permit_params :title, :description, :image, :price_usd, :price_isl, :category_id, :label_id

	index do
		column :title
		column :category
		column :label
		column :created_at
		
		column :price_isl, :sortable => :price_isl do |product|
			number_to_currency product.price_isl
		end
		column :price_usd, :sortable => :price_usd do |product|
			number_to_currency product.price_usd
		end

		actions
	end

end
