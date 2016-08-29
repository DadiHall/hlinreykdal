class OrderNotifier < ApplicationMailer

  default from: 'Hlín Reykdal Concept Store <store@hlinreykdal.com>'

  def received(order)
    @order = order

    mail to: order.email, subject: 'Hlín Reykdal Concept Store'
  end

  
  def shipped(order)
   @order = order

    mail to: order.email, subject: 'Order Shipped'
  end
end
