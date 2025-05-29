import 'package:glow_fit_app/features/gym/data/remote/mappers/user_mapper.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class UpdateUserUseCase {
  final GymRepository gymRepository;

  UpdateUserUseCase(this.gymRepository);

  Future<void> call(User user) async {
    return gymRepository.updateUser(UserMapper.toDto(user));
  }
}
