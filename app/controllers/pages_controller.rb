class PagesController < ApplicationController
  
include CurrentCart
before_action :set_cart, only: [:index]
  def index
  	   @products = Product.all.order(created_at: :desc).group_by(&:category_id)
  end

  def shop
  	@products = Product.all
  end
end
