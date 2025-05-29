import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';

class SignInWithEmailUseCase {
  final AuthRepository _repository;

  SignInWithEmailUseCase(this._repository);

  Future<void> execute(String email, String password) {
    return _repository.signInWithEmailAndPassword(email, password);
  }
}
