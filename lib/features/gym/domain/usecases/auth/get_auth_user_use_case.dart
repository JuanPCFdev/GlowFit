import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

class GetAuthUserUseCase {
  final AuthRepository _repository;

  GetAuthUserUseCase(this._repository);

  Future<AuthResult<User?>> execute() async {
    return await _repository.getCurrentUser();
  }
}
