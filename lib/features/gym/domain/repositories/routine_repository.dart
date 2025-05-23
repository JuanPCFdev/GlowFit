import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';

abstract class RoutineRepository {
  //CRUD
  Future<void> createRoutine(Routine routine);
  Future<List<Routine>> getUserRoutines(String userId);
  Future<Routine> getSingleUserRoutine(String userId, String routineId);
  Future<void> updateRoutine(Routine routine);
  Future<void> deleteRoutine(String userId, String routineId);
}
