class Api::V1::RoutinesController < ApplicationController
  skip_before_action :authorized
  def index
    @routines = Routine.all
  end

  def create
    @routine = Routine.create(routine_params)
  end

  private

  def routine_params
    params.require(:routine).permit(
      :name,
      :description,
      routine_exercises_attributes: [
        :exercise_id,
        :quantity,
        :distance,
        :weight,
        :duration
      ]
    )
  end
end