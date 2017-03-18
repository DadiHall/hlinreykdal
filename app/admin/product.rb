ActiveAdmin.register Product do


permit_params :title, :slug, :description, :stock_quantity, :image, :price_usd, :price_isl, :category_id, :label_id

	index do
		column :title
		column :slug
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

	form multipart: true do |f|
  			f.inputs "Product Details" do
    		f.input :title
    		f.input :slug
   			f.input :description, as: :ckeditor, input_html: { ckeditor: { toolbar: 'Full' } }
   			f.input :stock_quantity
   			f.input :image, required: false
   			f.input :price_usd
   			f.input :price_isl
   			f.input :category
   			f.input :label
  			end
  			f.actions	
		  end



end
