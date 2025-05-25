import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';

class UserMapper {
  static User fromFirebase(firebase.User firebaseUser) {
    return User(
      id: firebaseUser.uid,
      name: firebaseUser.displayName ?? '',
      email: firebaseUser.email ?? '',
      weight: 0.0, // Default values for new users
      height: 0.0,
      gender: Gender.other, // You might want to add a default value
      age: 0,
      routineIds: [],
    );
  }

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
