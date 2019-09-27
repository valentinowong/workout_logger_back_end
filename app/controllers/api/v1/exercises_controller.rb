class Api::V1::ExercisesController < ApplicationController
    def index
        @exercises = Exercise.all
    end
end
