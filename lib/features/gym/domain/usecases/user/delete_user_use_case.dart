import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class DeleteUserUseCase {
  final GymRepository _repository;
  DeleteUserUseCase(this._repository);

  Future<void> delete(String userId) async {
    await _repository.deleteUser(userId);
  }
}
