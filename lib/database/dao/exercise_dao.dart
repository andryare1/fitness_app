import 'package:floor/floor.dart';
import 'package:fitness/database/models/exercise.dart';

@dao
abstract class ExerciseDao {
  @Query('SELECT * FROM Exercise WHERE muscleGroup = :muscleGroup')
  Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup);

  @Query('SELECT * FROM Exercise')
  Future<List<Exercise>> getAllExercises();

  @insert
  Future<void> insertExercise(Exercise exercise);

  @Query('DELETE FROM Exercise')
  Future<void> clearTable();
}
