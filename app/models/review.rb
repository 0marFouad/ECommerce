class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates_length_of :body, minimum: 3, maximum: 50
end
