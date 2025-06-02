class ExerciseDto {
  final String id;
  final String name;
  final String type;
  final String description;
  final String image;
  final String difficulty;
  final int series;
  final int reps;
  final double weight;
  final List<String> muscles;

  ExerciseDto({
    required this.id,
    required this.name,
    required this.type,
    required this.description,
    required this.image,
    required this.difficulty,
    required this.series,
    required this.reps,
    required this.weight,
    required this.muscles,
  });

  factory ExerciseDto.fromFirestore(Map<String, dynamic> data, String id) {
    return ExerciseDto(
      id: id,
      name: data['name'] as String,
      type: data['type'] as String,
      description: data['description'] as String,
      image: data['image'] as String,
      difficulty: data['difficulty'] as String,
      series: (data['series'] as num).toInt() as int? ?? 0,
      reps: (data['reps'] as num).toInt() as int? ?? 0,
      weight: (data['weight'] as num).toDouble() as double? ?? 0.0,
      muscles: List<String>.from(data['muscules'] ?? List<dynamic>),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'type': type,
      'description': description,
      'image': image,
      'difficulty': difficulty,
      'series': series,
      'reps': reps,
      'weight': weight,
      'muscules': muscles,
    };
  }
}
