import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';

class Routine {
  final String name;
  final String description;
  final String dayOfWeek;
  final List<Exercise> exercises;

  const Routine({
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.exercises,
  });
}
