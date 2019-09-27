class Api::V1::RoutinesController < ApplicationController
  def index
    @routines = Routine.all
  end

  def create
    @routine = Routine.create(routine_params)
  end

  private

  def routine_params
    params.require(:routine).permit(:name)
  end
end
