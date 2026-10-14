class FoodsController < ApplicationController
  before_action :set_food, only: %i[show edit update destroy]

  def index
    load_foods
    @food = Food.new
  end

  def show
    respond_to do |format|
      format.html { redirect_to edit_food_path(@food) }
      format.json
    end
  end

  def edit
  end

  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: "Food added." }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { load_foods; render :index, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to foods_path, notice: "Food updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @food.destroy
      respond_to do |format|
        format.html { redirect_to foods_path, notice: "Food deleted.", status: :see_other }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to edit_food_path(@food), alert: @food.errors.full_messages.to_sentence, status: :see_other }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def load_foods
    @foods = Food.order(:name)
  end

  def food_params
    params.expect(food: [ :name, :kcal, :fat, :carbohydrate, :protein ])
  end
end
