class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_cart_item
  belongs_to :user ,validate: {presence => true}
  has_and_belongs_to_many :categories
  has_many :reviews
  has_many :cart_items
  has_many :order_products
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validate :has_one_category_at_least
  accepts_nested_attributes_for :categories
  def has_one_category_at_least
    if categories.empty?
      errors.add(:categories, "Product should at least has one category")
    end
  end

  private

  def not_referenced_by_any_cart_item
    unless cart_items.empty?
      errors.add(:base, 'Cart items present')
      throw :abort
    end
  end
end
