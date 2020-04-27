require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def get_user
    user = User.create(email: 'user11@gmail.com', password: '123456',name: 'user' , telephone: '0123456789')
  end

  def get_category
    category = Category.create(name: 'category')
  end

  def get_product
    category = get_category
    product = Product.new(name: 'product', stock: 15, price: 2.2 ,user: get_user, categories: [category])
  end

  test "create review without user" do
    review = Review.new(product: get_product , body: 'hello world')
    assert_not review.save
  end

  test "create review without body " do
    review = Review.new(product: get_product , user: get_user ,body: '')
    assert_not review.save
  end

  test "create review without product" do
    review = Review.new(user: get_user ,body: 'hello world')
    assert_not review.save
  end

  test "normal review save" do
    review = Review.new(product: get_product , user: get_user ,body: 'hello world')
    assert review.save
  end

  test "show linked user and product" do
    user = get_user
    product = get_product
    review = Review.new(product: product , user: user ,body: 'hello world')
    assert review.save
    assert_equal(user , review.user)
    assert_equal(product,review.product)
  end


end
