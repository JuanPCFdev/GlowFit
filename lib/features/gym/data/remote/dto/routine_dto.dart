class RoutineDto {
  final String id;
  final String name;
  final String description;
  final String dayOfWeek;
  final List<Map<String, dynamic>> exercises;

  const RoutineDto({
    required this.id,
    required this.name,
    required this.description,
    required this.dayOfWeek,
    required this.exercises,
  });

  factory RoutineDto.fromFirestore(Map<String, dynamic> data, String id) {
    return RoutineDto(
      id: id,
      name: data['name'],
      description: data['description'],
      dayOfWeek: data['dayOfWeek'],
      exercises: List<Map<String, dynamic>>.from(data['exercises']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'dayOfWeek': dayOfWeek,
      'exercises': exercises,
    };
  }
}
