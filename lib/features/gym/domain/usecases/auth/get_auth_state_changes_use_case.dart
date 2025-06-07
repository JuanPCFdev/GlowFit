import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';

class GetAuthStateChangesUseCase {
  final AuthRepository _repository;

  GetAuthStateChangesUseCase(this._repository);

  Stream<AuthResult<User?>> call() {
    return _repository.authStateChanges();
  }
}
