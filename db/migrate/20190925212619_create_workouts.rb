class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.string :title
      t.datetime :datetime
      t.string :photo
      t.integer :user_id
      t.integer :routine_id

      t.timestamps
    end
  end
end
