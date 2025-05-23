class Exercise {
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

  const Exercise({
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
}
