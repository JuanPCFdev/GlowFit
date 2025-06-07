import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class GetRoutineExerciseUseCase {
  final GymRepository gymRepository;
  GetRoutineExerciseUseCase(this.gymRepository);

  Future<RoutineExercise> call(String routineId, String exerciseId) async =>
      gymRepository.getRoutineExercise(routineId, exerciseId);
}
