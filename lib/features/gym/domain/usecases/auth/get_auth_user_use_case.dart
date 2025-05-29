import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';

class GetAuthUserUseCase {
  final AuthRepository authRepository;

  GetAuthUserUseCase(this.authRepository);

  Future<User?> call() async {
    return authRepository.getCurrentUser();
  }
}
