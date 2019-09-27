json.array! @workouts do |workout|
    
  workout_exercises = []

  workout.routine.routine_exercises.each do |routine_exercise|
    exercise = {}
    exercise[:id] = routine_exercise.exercise.id
    exercise[:name] = routine_exercise.exercise.name
    exercise[:routine_quantity] = routine_exercise.quantity
    exercise[:routine_distance] = routine_exercise.distance
    exercise[:routine_weight] = routine_exercise.weight
    exercise[:routine_duration] = routine_exercise.duration
    exercise[:completion_quantity] = Completion.find_by(workout_id: workout.id, exercise_id: routine_exercise.exercise.id) ? Completion.find_by(workout_id: workout.id, exercise_id: routine_exercise.exercise.id).quantity : nil
    exercise[:completion_distance] = Completion.find_by(workout_id: workout.id, exercise_id: routine_exercise.exercise.id) ? Completion.find_by(workout_id: workout.id, exercise_id: routine_exercise.exercise.id).distance : nil
    exercise[:completion_weight] = Completion.find_by(workout_id: workout.id, exercise_id: routine_exercise.exercise.id) ? Completion.find_by(workout_id: workout.id, exercise_id: routine_exercise.exercise.id).weight : nil
    exercise[:completion_duration] = Completion.find_by(workout_id: workout.id, exercise_id: routine_exercise.exercise.id) ? Completion.find_by(workout_id: workout.id, exercise_id: routine_exercise.exercise.id).duration : nil
    workout_exercises.push(exercise)
  end
  
  json.id workout.id
  json.title workout.title
  json.datetime workout.datetime
  json.photo workout.photo
  json.routine_name workout.routine.name
  json.routine_description workout.routine.description
  json.exercises workout_exercises
  
end