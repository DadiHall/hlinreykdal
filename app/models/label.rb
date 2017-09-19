class Label < ActiveRecord::Base
  #before_destroy :remove_label_from_products

	has_many :products, :dependent => :nullify
	has_many :pages
	has_many :images
	accepts_nested_attributes_for :images

  #private

    #def remove_label_from_products
      #Product.where(label_id: id).update_all(label_id: nil)  
    #end 

end