import 'package:glow_fit_app/features/gym/data/remote/dto/exercise_dto.dart';

class RoutineDto {
  final String id;
  final String name;
  final String description;
  final String dayOfWeek;
  final List<ExerciseDto> exercises;

  const RoutineDto({
    required this.id,
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.exercises,
  });

  factory RoutineDto.fromFirestore(Map<String, dynamic> data, String id) {
    final rawExercises = List<Map<String, dynamic>>.from(
      data['exercises'] ?? [],
    );
    return RoutineDto(
      id: id,
      name: data['name'] as String,
      description: data['description'] as String,
      dayOfWeek: data['dayOfWeek'] as String,
      exercises:
          rawExercises.map((e) {
            final exId = e['id'] as String;
            return ExerciseDto.fromFirestore(e, exId);
          }).toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'dayOfWeek': dayOfWeek,
      'exercises': exercises.map((e) => e.toFirestore()).toList(),
    };
  }
}
