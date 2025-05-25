import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';
import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';

class RoutineExerciseMapper {
  static RoutineExercise toDomain(Map<String, dynamic> data) {
    return RoutineExercise(
      id: data['id'],
      name: data['name'],
      type: ExerciseType.values.firstWhere((e) => e.name == data['type']),
      description: data['description'],
      image: data['image'],
      difficulty: Difficulty.values.firstWhere(
        (e) => e.name == data['difficulty'],
      ),
      series: data['series'].toInt(),
      reps: data['reps'].toInt(),
      weight: data['weight'].toDouble(),
      muscles: List<String>.from(data['muscules']),
    );
  }

  static Map<String, dynamic> toMap(RoutineExercise entity) {
    return {
      'id': entity.id,
      'type': entity.type.name,
      'name': entity.name,
      'description': entity.description,
      'image': entity.image,
      'difficulty': entity.difficulty.name,
      'series': entity.series,
      'reps': entity.reps,
      'weight': entity.weight,
      'muscules': entity.muscles,
    };
  }
}
