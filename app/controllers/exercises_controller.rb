class ExercisesController < ApplicationController
  before_action :authenticate_user!

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user_id = current_user.id
    if @exercise.save
      render json: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      render json: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
    head :no_content
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :burned_calories)
  end
end
