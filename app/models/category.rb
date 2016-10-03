class Category < ActiveRecord::Base
	#before_destroy :remove_category_from_products

	
	has_many :products, :dependent => :nullify
	
	#private

  #def remove_category_from_products
    #Product.where(category_id: id).update_all(category_id: nil)  
  #end 

end
