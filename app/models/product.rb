class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :label

	has_many :product_item

	before_destroy :ensure_not_product_item
	
	

		validates :title, :description, presence: true
		validates :price_usd, :price_isl, numericality: {greater_than_or_equal_to: 0.01}
		validates :title, uniqueness: true
		

	 has_attached_file :image, styles: { medium: "500x500#", thumb: "100x100#" }
  	 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  	 def ensure_not_product_item
  	 	if product_items.empty?
  	 		return true
  	 	else
  	 		errors.add(:base, 'You have Product Items')
  	 		return false
  	 	end

  	 end
end
