import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class GetRoutineUseCase {
  final GymRepository _repository;

  GetRoutineUseCase(this._repository);

  Future<Routine?> execute(String routineId) {
    return _repository.getRoutine(routineId);
  }
}
