import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';

class ExerciseModel {
  final String id;
  final String type;
  final String name;
  final String description;
  final String image;
  final String difficulty;
  final int series;
  final int reps;
  final double weight;
  final List<String> muscles;

  ExerciseModel({
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

  factory ExerciseModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ExerciseModel(
      id: doc.id,
      type: data['type'] ?? 'strength',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
      difficulty: data['difficulty'] ?? 'beginner',
      series: data['series'] ?? 0,
      reps: data['reps'] ?? 0,
      weight: data['weight']?.toDouble() ?? 0.0,
      muscles: List<String>.from(data['muscles'] ?? []),
    );
  }

  Exercise toDomainExercise(ExerciseModel model){
    return Exercise(
      id: model.id, 
      type: model.type, 
      name: model.name, 
      description: model.description, 
      image: model.image, 
      difficulty: model.difficulty, 
      series: model.series, 
      reps: model.reps, 
      weight: model.weight, 
      muscles: model.muscles
      );
  }

}
