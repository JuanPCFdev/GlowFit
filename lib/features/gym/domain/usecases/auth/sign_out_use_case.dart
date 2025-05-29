import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<void> execute() {
    return _repository.signOut();
  }
}
