class PagesController < ApplicationController
  
include CurrentCart
before_action :set_cart, only: [:index, :about, :help, :location]
  def index
  	   @products = Product.all.order(created_at: :desc).group_by(&:category_id)
  	    @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
     	@random_no = rand(10)
     	@random_image = @images[@random_no]
  end


  def about
    @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
     @random_no = rand(5)
     @random_image = @images[@random_no]

  end

  def location
    @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
     @random_no = rand(5)
     @random_image = @images[@random_no]


  end


  def shop
  	@products = Product.all
  end
end
