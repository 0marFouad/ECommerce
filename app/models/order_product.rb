class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validate :amount_greater_than_zero

  def amount_greater_than_zero
    if !amount.present? || amount <= 0
      errors.add(:order_products , "order product must  have amount greater than 0")
    end
  end
end
