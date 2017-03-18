class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :edit, :update, :destroy]

  def index
  	@labels = Label.all
  end

   def show
    @meta_title = "Hlín Reykdal - #{@label.name}"
  	@products = @label.products
     @images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
     @random_no = rand(5)
     @random_image = @images[@random_no]
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.includes(:products).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def label_params
      params.require(:label).permit(:label_name)
    end
end