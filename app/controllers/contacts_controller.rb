class ContactsController < ApplicationController
	
	include CurrentCart
	before_action :set_cart, only: [:new, :create]
	
	def new
		@meta_title ="Hlín Reykdal Contact"
		@contact = Contact.new
		@images  = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"]
     	@random_no = rand(5)
     	@random_image = @images[@random_no]
	end
	
	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			
			redirect_to root_url, notice: 'Thank You for Your Message'
		else
		  render :new
		end
	end
	
	private
	
	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
	
end