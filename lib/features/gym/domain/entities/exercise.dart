import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';

class RoutineExercise {
  final String id;
  final String name;
  final ExerciseType type;
  final String description;
  final String image;
  final Difficulty difficulty;
  final int series;
  final int reps;
  final double weight;
  final List<String> muscles;

  const RoutineExercise({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.image,
    required this.difficulty,
    required this.series,
    required this.reps,
    required this.weight,
    required this.muscles,
  });
}
