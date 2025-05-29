import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class SaveRoutineUseCase {
  final GymRepository _repository;

  SaveRoutineUseCase(this._repository);

  Future<void> execute(Routine routine) {
    return _repository.saveRoutine(routine);
  }
}
