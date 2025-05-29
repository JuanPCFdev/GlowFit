import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class DeleteRoutineUseCase {
  final GymRepository _repository;

  DeleteRoutineUseCase(this._repository);

  Future<void> delete(String routineId) async {
    await _repository.deleteRoutine(routineId);
  }
}
