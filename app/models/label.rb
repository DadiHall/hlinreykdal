class Label < ActiveRecord::Base
  #before_destroy :remove_label_from_products

	has_many :products, :dependent => :nullify
	has_many :pages

  #private

    #def remove_label_from_products
      #Product.where(label_id: id).update_all(label_id: nil)  
    #end 

end