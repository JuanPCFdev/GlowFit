import 'package:glow_fit_app/features/gym/data/models/muscle_model.dart';
import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';

class ExerciseModel extends Exercise {
  ExerciseModel({
    required super.type,
    required super.name,
    required super.description,
    required super.image,
    required super.difficulty,
    required super.muscles,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      type: json['type'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      difficulty: json['difficulty'],
      muscles:
          (json['muscles'] as List)
              .map((m) => MuscleModel.fromJson(m))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'name': name,
    'description': description,
    'image': image,
    'difficulty': difficulty,
    'muscles': muscles.map((m) => (m as MuscleModel).toJson()).toList(),
  };
}
