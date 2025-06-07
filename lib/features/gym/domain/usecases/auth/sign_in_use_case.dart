import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

class SignInWithEmailUseCase {
  final AuthRepository _repository;

  SignInWithEmailUseCase(this._repository);

  Future<AuthResult<User>> execute(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return AuthResult.error('El email y la contraseña son requeridos');
    }

    if (!email.contains('@')) {
      return AuthResult.error('El email no es válido');
    }

    if (password.length < 6) {
      return AuthResult.error('La contraseña debe tener al menos 6 caracteres');
    }

    try {
      return await _repository.signInWithEmailAndPassword(email, password);
    } catch (e) {
      return AuthResult.error('Error al iniciar sesión: ${e.toString()}');
    }
  }
}
