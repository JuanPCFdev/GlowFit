import 'package:glow_fit_app/features/gym/data/remote/dto/exercise_dto.dart';
import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';
import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';

class RoutineExerciseMapper {
  static RoutineExercise toDomain(ExerciseDto dto) {
    return RoutineExercise(
      id: dto.id,
      name: dto.name,
      type: ExerciseType.values.firstWhere((e) => e.name == dto.type),
      description: dto.description,
      image: dto.image,
      difficulty: Difficulty.values.firstWhere((e) => e.name == dto.difficulty),
      series: dto.series,
      reps: dto.reps,
      weight: dto.weight,
      muscles: dto.muscles,
    );
  }

  static ExerciseDto toDto(RoutineExercise entity) {
    return ExerciseDto(
      id: entity.id,
      name: entity.name,
      type: entity.type.name,
      description: entity.description,
      image: entity.image,
      difficulty: entity.difficulty.name,
      series: entity.series,
      reps: entity.reps,
      weight: entity.weight,
      muscles: entity.muscles,
    );
  }
}
