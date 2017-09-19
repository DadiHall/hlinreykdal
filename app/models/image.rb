class Image < ActiveRecord::Base

	  belongs_to :product
	  belongs_to :label
	  has_many :product_items, :dependent => :destroy

  		has_attached_file :image, styles: { medium: "500x500#", thumb: "100x100#" }
  		validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
