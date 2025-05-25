import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';
import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';

class Routine {
  final String id;
  final String name;
  final String description;
  final DayOfWeek dayOfWeek;
  final List<RoutineExercise> exercises;

  const Routine({
    required this.id,
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.exercises,
  });
}
