require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def get_user
    user = User.create(email: 'user11@gmail.com', password: '123456',name: 'user' , telephone: '0123456789')
  end

  def get_user2
    user = User.create(email: 'user22@gmail.com', password: '123456',name: 'user' , telephone: '0123456789')
  end

  def get_category
    category = Category.create(name: 'category')
  end

  def get_product
    category = get_category
    product = Product.create(name: 'product', stock: 15, price: 2.2 ,user: get_user, categories: [category])
  end
  def set_amount(order)
    order.order_products.each do |op|
      op.amount = 10
    end
    return order
  end

  test "normal order save" do
    order =  Order.new(shipping_date: Date.current , shipping_address: "123 street ,country" , status: false , user: get_user)
    assert order.save
  end

  test "create order without shipping date" do
    order =  Order.new(shipping_address: "123 street ,country" , status: false , user: get_user)
    assert_not order.save
  end

  test "create order without shipping address" do
    order =  Order.new(shipping_date: Date.current , status: false , user: get_user)
    assert_not order.save
  end

  test "create order without status" do
    order =  Order.new(shipping_date: Date.current , shipping_address: "123 street ,country" , user: get_user)
    assert_not order.save
  end

  test "create order without user" do
    order =  Order.new(shipping_date: Date.current , shipping_address: "123 street ,country" , status: false)
    assert_not order.save
  end

  test "normal order save with linking products" do
    order =  Order.new(shipping_date: Date.current , shipping_address: "123 street ,country" , status: false , user: get_user2)
    order.products << get_product
    set_amount(order)
    assert order.save
  end

  test "link order with product without specifying the amount" do
    order =  Order.new(shipping_date: Date.current , shipping_address: "123 street ,country" , status: false , user: get_user2)
    order.products << get_product
    assert_not order.save
  end




end
