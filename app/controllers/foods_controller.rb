class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
