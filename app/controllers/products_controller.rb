 class ProductsController < ApplicationController
 	before_action :set_product, only: [:show, :edit, :update, :destroy]


 	  def show
      offset = rand(100)
      @meta_title = "Hlín Reykdal #{@product.title}"
      @meta_description = @product.description
      @products = Product.offset(offset).limit(6)
  	  end

  def search
    
    @product = Product.search(params[:query]).order("created_at DESC")
    @categories = Category.joins(:products).where(:products => {:id => @product.map{|x| x.id }}).distinct


  end

 	private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :price_usd, :price_isl, :image, :category_id, :stock_quantity, :label_id, :query, :slug)
    end

  
 end
