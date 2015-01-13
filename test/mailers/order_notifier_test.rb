require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "CBS Shop Order Confirmation", mail.subject
    assert_equal ["cbsvi360@gmail.com"], mail.to
    assert_equal ["cbsshop@example.com"], mail.from
    assert_match /1 x CBS Shop/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "CBS Shop", mail.subject
    assert_equal ["cbsvi360@gmail.com"], mail.to
    assert_equal ["cbsshop@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>CBS Shop<\/td>/, mail.body.encoded
  end
end
