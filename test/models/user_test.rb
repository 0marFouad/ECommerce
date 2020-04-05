require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user email should be on right format" do
     user = User.new(email: '123456', password: '123456')
     assert_not user.save
  end
  test "user email should be on right format2" do
    user = User.new(email: 'emaaail' , password: '123456')
    assert_not user.save
  end

  test "user must have email" do
    user = User.new(password: '123456')
    assert_not user.save
  end

  test "user must have password" do
    user = User.new(email: 'emaaail@gmail.com')
    assert_not user.save
  end

  test "normal_user_saving" do
    user = User.new(email: 'emaaaail@gamil.com' , password: '123456')
    assert user.save
  end
end
