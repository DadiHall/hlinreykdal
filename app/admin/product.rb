ActiveAdmin.register Product do

  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column
  config.paginate   = true # optional; drag-and-drop across pages is not supported

  sortable # creates the controller action which handles the sorting

permit_params :title, :slug, :description, :stock_quantity, :image, :price_usd, :price_isl, :category_id, :label_id,  images_attributes: [:image , :id , :_destroy]

	index do
		 sortable_handle_column # inserts a drag handle
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

   				
      			f.has_many :images , heading: false, allow_destroy: true do |ff|
        		ff.input :image, required: true, as: :file
      		     end
    	     
  			end

  			f.actions	

  			
    end



end
