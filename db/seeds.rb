# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'Valentino', password_digest: '123456')

Exercise.create(name: 'Running')
Exercise.create(name: 'Biking')
Exercise.create(name: 'Swimming')
Exercise.create(name: 'Bench Press')

Routine.create(name: 'Running & Lifting')

RoutineExercise.create(routine_id: Routine.find_by(name: 'Running & Lifting').id, exercise_id: Exercise.find_by(name: 'Running').id, quantity: 0, weight: 0, distance: 3, duration: 0)
RoutineExercise.create(routine_id: Routine.find_by(name: 'Running & Lifting').id, exercise_id: Exercise.find_by(name: 'Bench Press').id, quantity: 10, weight: 135, distance: 0, duration: 0)

Workout.create(user_id: User.find_by(username: 'Valentino').id, routine_id: Routine.find_by(name: 'Running & Lifting').id, title: "Valentino's Wednesday Lunch Workout", datetime: Time.now, photo: "https://d2z0k43lzfi12d.cloudfront.net/blog/vcdn277/wp-content/uploads/2018/04/thumbnail_8-tips-beginner_1200x800-1024x683.jpg")

Completion.create(workout_id: Workout.find_by(title: "Valentino's Wednesday Lunch Workout").id, exercise_id: Exercise.find_by(name: 'Running').id, quantity: 0, weight: 0, distance: 3, duration: 1440)
Completion.create(workout_id: Workout.find_by(title: "Valentino's Wednesday Lunch Workout").id, exercise_id: Exercise.find_by(name: 'Bench Press').id, quantity: 10, weight: 135, distance: 0, duration: 0)