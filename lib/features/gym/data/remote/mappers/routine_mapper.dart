import 'package:glow_fit_app/features/gym/data/remote/dto/routine_dto.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/routine_exercise_mapper.dart';
import 'package:glow_fit_app/features/gym/domain/entities/enums.dart';
import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';

class RoutineMapper {
  static Routine toDomain(RoutineDto dto) {
    return Routine(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      dayOfWeek: DayOfWeek.values.firstWhere((e) => e.name == dto.dayOfWeek),
      exercises:
          dto.exercises
              .map((exerciseDto) => RoutineExerciseMapper.toDomain(exerciseDto))
              .toList(),
    );
  }

  static RoutineDto toDTO(Routine entity) {
    return RoutineDto(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      dayOfWeek: entity.dayOfWeek.name,
      exercises:
          entity.exercises
              .map((exercise) => RoutineExerciseMapper.toDto(exercise))
              .toList(),
    );
  }
}
