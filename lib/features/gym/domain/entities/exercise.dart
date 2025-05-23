import 'package:glow_fit_app/features/gym/domain/entities/muscle.dart';

class Exercise {
  final String type;
  final String name;
  final String description;
  final String image;
  final String difficulty;
  final List<Muscle> muscles;

  const Exercise({
    required this.type,
    required this.name,
    required this.description,
    required this.image,
    required this.difficulty,
    required this.muscles,
  });
}
