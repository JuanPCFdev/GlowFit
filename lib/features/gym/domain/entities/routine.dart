import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';

class Routine {
  final String id;
  final String name;
  final String description;
  final String dayOfWeek;
  final List<Exercise> exercises;

  const Routine({
    required this.id,
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.exercises,
  });
}
