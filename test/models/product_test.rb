require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def get_category
    category = Category.create(name: 'category')
    return category
  end

  def get_user
    user = User.create(email: 'user11@gmail.com', password: '123456',telephone: '0123456789' , name: 'user1')
    return user
  end

  test "product must belong to user" do
    category = get_category
    product = Product.new(name: 'product', stock: 15, price: 2.2 , categories: [category])
    assert_not product.save
  end

  test "product must have stock number" do
    user = get_user
    category = get_category
    product = Product.new(name: 'product', price: 2.2 ,user: user, categories: [category])
    assert_not product.save
  end

  test 'product must have name' do
    user = get_user
    category = get_category
    product = Product.new(stock: 15, price: 2.2 ,user: user, categories: [category])
    assert_not product.save
  end

  test "product must have price number" do
    user = get_user
    category = get_category
    product = Product.new(name: 'product', stock: 15 ,user: user, categories: [category])
    assert_not product.save
  end

  test "product must have at least one category" do
    user = get_user
    product = Product.new(name: 'product', stock: 15, price: 2.2 , user: user)
    assert_not product.save
  end

  test "listing_associated_categories" do
    user = get_user
    category1 = Category.create(name: 'category1')
    category2 = Category.create(name: 'category2')
    product = Product.create(name: 'product', stock: 15, price: 2.2 , user: user, categories: [category1, category2])
    assert_equal(category1 , product.categories.first)
    assert_equal(category2 , product.categories.second)
  end

  test 'normal_category_saving' do
    user = get_user
    category = get_category
    product = Product.new(name: 'product', stock: 15, price: 2.2 ,user: user, categories: [category])
    assert product.save
  end

end
