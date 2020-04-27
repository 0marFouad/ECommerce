class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products , through: :order_products

  validates :shipping_date, :presence => true
  validates :shipping_address , :presence => true
  validates :status , inclusion: { in: [ true, false ] }, allow_nil: false
end
