class Routine < ApplicationRecord
    has_many :workouts
    has_many :routine_exercises
    has_many :exercises, through: :routine_exercises
end
