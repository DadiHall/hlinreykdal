class PagesController < ApplicationController
  
include CurrentCart
before_action :set_cart, only: [:index, :about, :help, :location, :terms, :privacy]
  def index
        @meta_title ="Hlín Reykdal Concept Store"
        @meta_description = "Hlín Reykdal Consept store - Icelandic Design"
  	   @products = Product.all.order(created_at: :desc).group_by(&:category_id)
       @product_images = Image.all.order(updated_at: :desc)
  	    @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
     	@random_no = rand(10)
     	@random_image = @images[@random_no]
  end


  def about
    @meta_title ="Hlín Reykdal About"
    @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
     @random_no = rand(5)
     @random_image = @images[@random_no]

  end

  def location
    @meta_title ="Hlín Reykdal Store Location"
    @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
     @random_no = rand(5)
     @random_image = @images[@random_no]


  end


  def shop
  	@products = Product.all
  end
end
