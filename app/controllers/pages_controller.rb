class PagesController < ApplicationController
  
include CurrentCart
before_action :set_cart, only: [:index, :about, :help]
  def index
  	   @products = Product.all.order(created_at: :desc).group_by(&:category_id)
  end


  def about

  end


  def shop
  	@products = Product.all
  end
end
