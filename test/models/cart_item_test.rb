require 'test_helper'

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #


  def get_cart
    cart = Cart.create()
    return cart
  end


  def get_category
    category = Category.create(name: 'category')
    return category
  end


  def get_user
    user = User.create(email: 'user11@gmail.com', password: '123456',telephone: '0123456789' , name: 'user1')
    return user
  end


  def get_product
    product = Product.new(name: 'product', stock: 15, price: 2.2 ,user: get_user, categories: [get_category])
  end


  test "create normal cartItem" do
    cart_item = CartItem.new(cart: get_cart, product: get_product, quantity: 12)
    assert cart_item.save
  end


  test "create cartItem without cart" do
    cart_item = CartItem.new(product: get_product, quantity: 12)
    assert_not cart_item.save
  end


  test "create cartItem without product" do
    cart_item = CartItem.new(cart: get_cart, quantity: 12)
    assert_not cart_item.save
  end


  test "check cartItem default quantity" do
    cart_item = CartItem.create(cart: get_cart, product: get_product, quantity: 1)
    assert_equal(1 , cart_item.quantity)
  end


  test "check cartItem inserted quantity" do
    cart_item = CartItem.create(cart: get_cart, product: get_product, quantity: 12)
    assert_equal(12 , cart_item.quantity)
  end


  test "check cartItem total price" do
    cart_item = CartItem.create(cart: get_cart, product: get_product, quantity: 12)
    assert_equal(cart_item.total_price , 12 * 2.2)
  end


  test "check cartItem quantity greater than zero" do
    c = get_cart
    p = get_product
    cart_item = CartItem.new(cart: c, product: p, quantity: 0)
    assert_not cart_item.save
    cart_item = CartItem.new(cart: c, product: p, quantity: -1)
    assert_not cart_item.save
    cart_item = CartItem.new(cart: c, product: p, quantity: 1)
    assert cart_item.save
  end
end
