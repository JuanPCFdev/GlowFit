import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';

abstract class ExerciseRepository {
  //CRUD
  Future<void> createExercise(Exercise exercise);
  Future<Exercise> getExercise(
    String userId,
    String routineId,
    String exerciseId,
  );
  Future<List<Exercise>> getRoutineExcersises(String userId, String routineId);
  Future<void> updateExercise(Exercise exercise);
  Future<void> deleteExercise(
    String userId,
    String routineId,
    String exerciseId,
  );
}
