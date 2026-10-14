require "test_helper"

class FoodTest < ActiveSupport::TestCase
  test "valid" do
    food = Food.new(name: "Testfood", kcal: 100)
    assert food.valid?
  end

  test "name must be unique" do
    food = Food.new(name: "egg", kcal: 100)
    assert_not food.valid?
    assert_includes food.errors[:name], "has already been taken"
  end
end
