import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class GetUserUseCase {
  final GymRepository _repository;

  GetUserUseCase(this._repository);

  Future<User?> execute(String userId) {
    return _repository.getUser(userId);
  }
}
