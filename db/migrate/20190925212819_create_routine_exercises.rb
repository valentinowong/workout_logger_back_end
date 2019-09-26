class CreateRoutineExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :routine_exercises do |t|
      t.integer :routine_id
      t.integer :exercise_id
      t.integer :quantity
      t.float :distance
      t.float :weight
      t.integer :duration

      t.timestamps
    end
  end
end
