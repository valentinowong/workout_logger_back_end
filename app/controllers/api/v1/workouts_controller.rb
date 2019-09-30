class Api::V1::WorkoutsController < ApplicationController
  before_action :set_workout, only: [:update, :destroy]
  
  def index
    @user = User.find(params[:user_id])
    @workouts = Workout.where(user_id: @user.id)
  end

  def create
    @user = User.find(params[:user_id])
    @workout = @user.workouts.create(workout_params)
  end

  def update
    @workout.update(workout_params)
  end

  def destroy
    @workout.destroy
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:id, :title, :datetime, :photo, :user_id, :routine_id)
  end
end
