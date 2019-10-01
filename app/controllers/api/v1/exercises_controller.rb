class Api::V1::ExercisesController < ApplicationController
    skip_before_action :authorized
    def index
        @exercises = Exercise.all
    end
end
