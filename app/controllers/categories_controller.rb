class CategoriesController < ApplicationController
	 before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
  	@categories = Category.all
  end

   def show
    @meta_title = "Hlín Reykdal - #{@category.name}"
    @meta_description = "Hlín Reykdal - #{@category.name}"
  	@products = @category.products
     @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
     @random_no = rand(5)
     @random_image = @images[@random_no]
  end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.includes(:products).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :slug)
    end

  
end
