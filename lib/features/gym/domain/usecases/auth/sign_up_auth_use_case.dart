import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

class SignUpAuthUseCase {
  final AuthRepository _repository;

  SignUpAuthUseCase(this._repository);

  Future<AuthResult<User>> signUp(
    String email,
    String password,
    String? name,
  ) async {
    if (email.isEmpty || password.isEmpty) {
      return AuthResult.error('El email y la contraseña son requeridos');
    }

    if (!email.contains('@')) {
      return AuthResult.error('El email no es válido');
    }

    if (password.length < 6) {
      return AuthResult.error('La contraseña debe tener al menos 6 caracteres');
    }

    return await _repository.signUpWithEmailAndPassword(email, password, name);
  }
}
