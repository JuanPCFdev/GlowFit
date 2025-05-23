import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';

abstract class RoutineRepository {
  Future<List<Routine>> getUserRoutines(String userId);
  Future<void> saveRoutine(Routine routine);
}
