class OrderNotifier < ApplicationMailer
  default from: 'Modern Store <cjmont7@mail.com>'

 def received(order)
    @order = order

    mail to: order.email, subject: 'Modern Store Order'
  end
  
  def shipped(order)
    @order = order

    mail to: order.email, subject: 'Order Shipped'
  end
end

  