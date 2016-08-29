ActiveAdmin.register Order do

	show do |order|

		panel 'Customer Details' do
			attributes_table_for order, :name, :email, :address, :city, :country, :created_at
		end


		panel 'Order Details' do
			table_for(order.product_items) do 
				column 'Product' do |item|
					item.product.title
				end
				column 'Quantity' do |item|
					item.quantity.title
				end
				column 'Price Isl' do |item|
					number_to_currency item.total_price_isl
				end
				column 'Price USD' do |item|
					number_to_currency item.total_price_usd
				end
			end
		end

		panel 'Order Total USD' do 
			number_to_currency order.total_price_usd

		end

		panel 'Order Total Iskr' do 
			number_to_currency order.total_price_isl

		end

	end


end
