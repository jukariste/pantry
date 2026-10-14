class MealFoodsController < ApplicationController
  before_action :set_meal

  def create
    meal_food = @meal.meal_foods.build(meal_food_params)
    if meal_food.save
      redirect_to edit_meal_path(@meal), notice: "Food added."
    else
      redirect_to @meal, alert: meal_food.errors.full_messages.to_sentence
    end
  end

  def update
    meal_food = @meal.meal_foods.find(params[:id])
    if meal_food.update(meal_food_params.slice(:quantity))
      redirect_to @meal, notice: "Quantity updated."
    else
      redirect_to @meal, alert: meal_food.errors.full_messages.to_sentence
    end
  end

  def destroy
    @meal.meal_foods.find(params[:id]).destroy
    redirect_to @meal, notice: "Food removed.", status: :see_other
  end

  private

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end

  def meal_food_params
    params.expect(meal_food: [ :food_id, :quantity ])
  end
end
