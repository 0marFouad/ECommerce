require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def get_user
    user = User.create(email: 'user11@gmail.com', password: '123456',name: 'user' , telephone: '0123456789')
  end

  test "create review without user" do
    review = Review.new()
  end

end
