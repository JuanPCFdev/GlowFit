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

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.weight,
    required this.height,
    required this.gender,
    required this.age,
    required this.routineIds,
  });
}
