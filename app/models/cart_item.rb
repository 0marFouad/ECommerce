class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  validate :quantity_greater_or_equal_one
  def total_price
    product.price.to_f * quantity.to_f
  end
  def quantity_greater_or_equal_one
    if self.quantity < 1
      errors.add(:base, 'quantity must be greater than 0')
    end
  end
end
