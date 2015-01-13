class OrderNotifier < ActionMailer::Base
  default from: 'Chéri B. <cbsshop@example.com>'

  def received
    @greeting = "Hi"
    @order = order

    mail to: order.email, subject: 'CBS Shop Order Confirmation'
  end

  def shipped
    @greeting = "Hi"
    @order = order

    mail to: order.email, subject: 'CBS Shop Order Confirmation'
  end
end
