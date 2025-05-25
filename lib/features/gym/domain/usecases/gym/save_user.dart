import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class SaveUserUseCase {
  final GymRepository _repository;

  SaveUserUseCase(this._repository);

  Future<void> execute(User user) {
    return _repository.saveUser(user);
  }
}
