import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';
import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

class UserMapper {
  static User toDomain(UserDto dto) {
    return User(
      id: dto.id,
      name: dto.name,
      email: dto.email,
      weight: dto.weight,
      height: dto.height,
      gender: _stringToGender(dto.gender),
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
      gender: _genderToString(user.gender),
      age: user.age,
      routineIds: user.routineIds,
    );
  }

  //Helper to convert Gender to String
  static String _genderToString(Gender gender) {
    return gender.toString().split('.').last;
  }

  //Helper to convert String to Gender
  static Gender _stringToGender(String genderString) {
    switch (genderString.toLowerCase()) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      case 'other':
        return Gender.other;
      default:
        return Gender.other;
    }
  }
}
