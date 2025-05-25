import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

class UserMapper {
  static User toDomain(UserDto dto) {
    return User(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      weight: dto.weight,
      height: dto.height,
      gender: dto.gender,
      age: dto.age,
      routineIds: dto.routineIds,
    );
  }

  static UserDto toDto(User user) {
    return UserDto(
      id: user.id,
      name: user.name,
      email: user.email,
      weight: user.weight,
      height: user.height,
      gender: user.gender,
      age: user.age,
      routineIds: user.routineIds,
    );
  }
}
