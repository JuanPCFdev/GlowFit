import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';

class SignUpAuthUseCase {
  final AuthRepository _repository;

  SignUpAuthUseCase(this._repository);

  Future<User?> signUp(String email, String password) {
    return _repository.signUpWithEmailAndPassword(email, password);
  }
}
