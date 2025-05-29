import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class UpdateRoutineUseCase {
  final GymRepository _repository;

  UpdateRoutineUseCase(this._repository);

  Future<void> update(Routine routine) async {
    await _repository.updateRoutine(routine);
  }
}
