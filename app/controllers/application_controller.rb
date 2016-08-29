class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :find_categories
  before_action :find_labels
  before_action :set_cart

 

    def find_categories
    	cururl = request.original_url
    	cururl.to_s
    if cururl.include? "admin"
      ##Dont run navi code!
    else
  	@categories = Category.all
  end
  end

  def find_labels

    @labels = Label.all
  end
 
 def set_cart
    @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end




end
