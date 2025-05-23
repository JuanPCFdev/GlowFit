import 'package:glow_fit_app/features/gym/data/models/routine_model.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.password,
    required super.weight,
    required super.height,
    required super.gender,
    required super.age,
    required super.routines,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      weight: json['weight'].toDouble(),
      height: json['height'].toDouble(),
      gender: json['gender'],
      age: json['age'],
      routines:
          (json['routines'] as List)
              .map((r) => RoutineModel.fromJson(r))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'weight': weight,
    'height': height,
    'gender': gender,
    'age': age,
    'routines': routines.map((r) => (r as RoutineModel).toJson()).toList(),
  };
}
