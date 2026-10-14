require "test_helper"

class FoodsControllerTest < ActionDispatch::IntegrationTest
  test "index and edit pages render" do
    get foods_url
    assert_response :success

    get edit_food_url(foods(:banana))
    assert_response :success
  end

  test "create" do
    assert_difference("Food.count", 1) do
      post foods_url, params: { food: { name: "NewFood", kcal: 389 } }
    end
    assert_redirected_to foods_url
  end

  test "update" do
    patch food_url(foods(:banana)), params: { food: { kcal: 90 } }
    assert_redirected_to foods_url
    assert_equal 90, foods(:banana).reload.kcal
  end

  test "destroy unused food" do
    assert_difference("Food.count", -1) do
      delete food_url(foods(:apple))
    end
  end

  test "cannot destroy food used in a meal" do
    assert_no_difference("Food.count") do
      delete food_url(foods(:banana))
    end
    assert_redirected_to edit_food_url(foods(:banana))
  end
end
