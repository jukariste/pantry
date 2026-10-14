require "test_helper"

class MealsControllerTest < ActionDispatch::IntegrationTest
  test "index and edit pages render" do
    get meals_url
    assert_response :success

    get edit_meal_url(meals(:breakfast))
    assert_response :success
  end

  test "create redirects to edit" do
    assert_difference("Meal.count", 1) do
      post meals_url, params: { meal: { name: "Dinner" } }
    end
    assert_redirected_to edit_meal_url(Meal.last)
  end

  test "update" do
    patch meal_url(meals(:breakfast)), params: { meal: { name: "Big breakfast" } }
    assert_equal "Big breakfast", meals(:breakfast).reload.name
  end

  test "destroy" do
    assert_difference("Meal.count", -1) do
      delete meal_url(meals(:breakfast))
    end
  end
end
