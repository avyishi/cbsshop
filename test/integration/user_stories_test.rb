require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  LineItem.delete_all
  Order.delete_all
  cbs_shop = products(:beats)

  get "/"
  assert_response :success
  assert_template "index"

  xml_http_request :post, '/line_items', product_id: cbs_shop.id
  assert_response :success

  cart: Cart.find(session[:cart_id])
  assert_equal 1, cart.line_items.size
  assert_equal cbs_shop, cart.line_items[0].product

  get "/orders/new"
  assert_response :success
  assert_template "new"

  post_via_redirect "/orders",
                    order: {name:   "Chéri B.",
                    address: "222 Somewhere",
                    email:    "cbsvi360@gmail.com", 
                    pay_type: "Credit" }
  assert_response  :success
  assert_template "index"
  cart = Cart.find(session[:cart_id])
  assert_equal 0, cart.line_items.size

  orders = Order.all
  assert_equal 1, orders.size
  order = orders[0]

  assert_equal "Chéri B.",    order.name
  assert_equal "222 Somewhere",   order.address
  assert_equal "cbsvi360@gmail.com", order.email
  assert_equal "Credit",             order.pay_type

  assert_equal 1, order.line_items.size
  line_item = order.line_items[0]
  assert_equal cbs_shop, line_item.product

  mail = ActionMailer::Base.deliveries.last
  assert_equal ["cbsvi360@gmail.com"], mail.to
  assert_equal 'Chéri B. <cbs_shop@example.com', mail[:from].value
  assert_equal "CBS Shop Order Confirmation", mail.subject
  end
end
