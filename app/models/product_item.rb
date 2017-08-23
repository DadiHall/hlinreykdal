class ProductItem < ActiveRecord::Base
  belongs_to :product 
  belongs_to :cart
  belongs_to :order

  belongs_to :image

 


  def total_price_usd
  		product.price_usd * quantity
  end

  def total_price_isl
  		product.price_isl * quantity
  end

  
end
