import 'package:glow_fit_app/features/gym/data/models/exercise_model.dart';
import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';

class RoutineModel extends Routine {
  RoutineModel({
    required super.name,
    required super.description,
    required super.dayOfWeek,
    required super.exercises,
  });

  factory RoutineModel.fromJson(Map<String, dynamic> json) {
    return RoutineModel(
      name: json['name'],
      description: json['description'],
      dayOfWeek: json['dayOfWeek'],
      exercises:
          (json['exercises'] as List)
              .map((e) => ExerciseModel.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'dayOfWeek': dayOfWeek,
    'exercises': exercises.map((e) => (e as ExerciseModel).toJson()).toList(),
  };
}
