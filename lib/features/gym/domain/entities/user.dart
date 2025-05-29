import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';

class User {
  final String id;
  final String name;
  final String email;
  final double weight;
  final double height;
  final Gender gender;
  final int age;
  final List<String> routineIds;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.weight,
    required this.height,
    required this.gender,
    required this.age,
    required this.routineIds,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'weight': weight,
      'height': height,
      'gender': gender.toString(),
      'age': age,
      'routineIds': routineIds,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      weight: (map['weight'] as num).toDouble(),
      height: (map['height'] as num).toDouble(),
      gender: Gender.values.firstWhere(
        (element) => element.toString() == map['gender'],
        orElse: () => Gender.male,
      ),
      age: map['age'] as int,
      routineIds: List<String>.from(map['routineIds'] ?? []),
    );
  }
}
