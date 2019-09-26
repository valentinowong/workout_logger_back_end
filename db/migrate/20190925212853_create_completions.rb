class CreateCompletions < ActiveRecord::Migration[5.2]
  def change
    create_table :completions do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.integer :quantity
      t.float :distance
      t.float :weight

      t.timestamps
    end
  end
end
