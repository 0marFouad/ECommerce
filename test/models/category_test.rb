require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def get_user
    user = User.create(email: 'user11@gmail.com', password: '123456')
    return user
  end
  test "category must have name" do
    category = Category.new
    assert_not category.save
  end

  test "listing_associated_products" do
    user = get_user
    category = Category.create(name: 'category')
    product1 = Product.create(name: 'product1', stock: 15, price: 2.2 , user: user , categories: [category])
    product2 = Product.create(name: 'product2', stock: 15, price: 2.2 , user: user , categories: [category])
    assert_equal(product1 , category.products.first)
    assert_equal(product2, category.products.second)
  end

  test "normal_category_saving" do
    category = Category.new(name: 'category1')
    assert category.save
  end


end
