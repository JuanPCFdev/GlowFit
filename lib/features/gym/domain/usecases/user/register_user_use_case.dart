import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class RegisterUserUseCase {
  final GymRepository gymRepository;

  RegisterUserUseCase(this.gymRepository);

  Future<void> register(String email, String password) async {
    await gymRepository.registerUser(email, password);
  }
}
