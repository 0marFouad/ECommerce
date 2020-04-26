class Product < ApplicationRecord
  belongs_to :user ,validate: {presence => true}
  has_and_belongs_to_many :categories
  has_many :reviews
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validate :has_one_category_at_least

  def has_one_category_at_least
    if categories.empty?
      errors.add(:categories, "Product should at least has one category")
    end
  end
end
