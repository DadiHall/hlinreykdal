class Product < ActiveRecord::Base
	acts_as_list :scope => [:category, :label]
	belongs_to :category
	belongs_to :label

	has_many :images
	accepts_nested_attributes_for :images
	has_many :product_items, :dependent => :destroy



	 extend FriendlyId
     friendly_id :title, use: [:slugged, :finders]

	#before_destroy :ensure_not_product_item
	
	

		validates :title, :description, presence: true
		validates :price_usd, :price_isl, numericality: {greater_than_or_equal_to: 0.01}
		validates :title, uniqueness: true
	


  	 #def ensure_not_product_item
  	 #	if product_item.empty?
  	 #		return true
  	 #	else
  	 #		errors.add(:base, 'You have Product Items')
  	 #		return false
  	 #	end

  	 #end

  	 def self.search(query)
		
     where("title LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%") 
    end
end
