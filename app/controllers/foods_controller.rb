class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = Food.where(user_id: current_user.id)
    @exercises = Exercise.where(user_id: current_user.id)
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      render json: @food
    end
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      render json: @food
    else
      render json: @food.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    head :no_content
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
