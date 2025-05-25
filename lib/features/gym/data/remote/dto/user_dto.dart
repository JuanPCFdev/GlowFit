import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';

class UserDto {
  final String id;
  final String name;
  final String email;
  final double weight;
  final double height;
  final Gender gender;
  final int age;
  final List<String> routineIds;

  const UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.weight,
    required this.height,
    required this.gender,
    required this.age,
    required this.routineIds,
  });

  factory UserDto.fromFirestore(Map<String, dynamic> data, String id) {
    final genderString = data['gender'] as String;
    final gender = Gender.values.firstWhere(
      (e) => e.name.toLowerCase() == genderString.toLowerCase(),
      orElse: () => Gender.other,
    );
    
    return UserDto(
      id: id,
      name: data['name'],
      email: data['email'],
      weight: data['weight'].toDouble(),
      height: data['height'].toDouble(),
      gender: gender,
      age: data['age'],
      routineIds: List<String>.from(data['routineIds'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'weight': weight,
      'height': height,
      'gender': gender,
      'age': age,
      'routineIds': routineIds,
    };
  }
}
