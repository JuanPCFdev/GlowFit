import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class GetUserRoutinesUseCase {
  final GymRepository repository;
  GetUserRoutinesUseCase(this.repository);

  Future<List<Routine>> execute(String userId) {
    return repository.getAllUserRoutines(userId);
  }
}
