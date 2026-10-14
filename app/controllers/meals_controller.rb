class MealsController < ApplicationController
  before_action :set_meal, only: %i[show edit update destroy]

  def index
    load_meals
    @meal = Meal.new
  end

  def show
    respond_to do |format|
      format.html { redirect_to edit_meal_path(@meal) }
      format.json
    end
  end

  def edit
  end

  def create
    @meal = Meal.new(meal_params)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to edit_meal_path(@meal), notice: "Meal created. Add some foods." }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { load_meals; render :index, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to edit_meal_path(@meal), notice: "Meal updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meal.destroy!

    respond_to do |format|
      format.html { redirect_to meals_path, notice: "Meal deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def load_meals
    @meals = Meal.includes(meal_foods: :food).order(:name)
  end

  def meal_params
    params.expect(meal: [ :name ])
  end
end
