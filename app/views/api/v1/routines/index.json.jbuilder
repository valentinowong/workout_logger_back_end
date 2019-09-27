json.array! @routines do |routine|
    
    routine_exercises = []
  
    routine.routine_exercises.each do |routine_exercise|
      exercise = {}
      exercise[:id] = routine_exercise.exercise.id
      exercise[:name] = routine_exercise.exercise.name
      exercise[:routine_quantity] = routine_exercise.quantity
      exercise[:routine_distance] = routine_exercise.distance
      exercise[:routine_weight] = routine_exercise.weight
      exercise[:routine_duration] = routine_exercise.duration
      routine_exercises.push(exercise)
    end
    
    json.id routine.id
    json.name routine.name
    json.exercises routine_exercises
    
  end