class OrderNotifier < ApplicationMailer

  default from: 'Hlín Reykdal Concept Store <hlin@hlinreykdal.com>'

  def received(order)
    @order = order

    mail to: order.email, subject: 'Hlín Reykdal Concept Store'
  end

  
  def shipped(order)
  	 Rails.logger.info "SMTP_ADDR: #{ENV["SMTP_ADDRESS"].inspect}"
   @order = order

    mail to: order.email, subject: 'Order Shipped'
  end
end
