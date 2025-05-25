import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';

class SignUpWithEmailUseCase {
  final AuthRepository _repository;
  SignUpWithEmailUseCase(this._repository);

  Future<void> execute(String email, String password) {
    return _repository.signUpWithEmailAndPassword(email, password);
  }
}
