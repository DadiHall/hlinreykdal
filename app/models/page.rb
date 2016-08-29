class Page < ActiveRecord::Base
	has_many :products
	belongs_to :category
	belongs_to :label
	
end
