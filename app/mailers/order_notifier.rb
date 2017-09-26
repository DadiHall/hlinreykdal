class OrderNotifier < ApplicationMailer

  default from: 'Hlín Reykdal Concept Store <hlin@hlinreykdal.com>'

  def received(order)
    @order = order

    mail (to: order.email, subject: 'Hlín Reykdal Concept Store', 
      bcc: %w[
              hlin@hlinreykdal.com
            ]
            )
    
  end

  
  def shipped(order)
  	
   @order = order

    mail to: order.email, subject: 'Order Shipped'
  end


  
end
