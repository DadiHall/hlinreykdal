class CartsController < ApplicationController

	before_action :set_cart, only: [:show, :destroy]
	#rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

	def new
		@cart = Cart.new
	end

	def show
		 @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
     @random_no = rand(5)
     @random_image = @images[@random_no]

	end


	#def destroy
	#	@cart.destroy if @cart.id == session[:cart_id]
	#	session[:cart_id] = nil
	#	product = Product.find params[:product_id]
     #   product.update_columns(stock_quantity: product.stock_quantity + 1)
	#	redirect_to root_url, notice: 'Your Cart is Empty'
	#end

	def destroy
      if @cart.id == session[:cart_id]
        @cart.product_items.each do |product_item|
          product_item.product.update_columns(stock_quantity: product_item.product.stock_quantity + 1)
       end
       @cart.destroy
       redirect_to root_url, notice: 'Your Cart is Empty'
      end
    end

	
	private

	def set_cart
		@cart = Cart.find(params[:id])
	end

	def cart_params
		params[:cart]
	end

	def invalid_cart
		logger_error = 'You are trying to access invalid cart'
		redirect_to root_url, notice: 'Invalid Cart'
	end
end
