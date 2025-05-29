class UserDto {
  final String id;
  final String name;
  final String email;
  final double weight;
  final double height;
  final String gender;
  final int age;
  final List<String> routineIds;

  const UserDto({
    required this.id,
    required this.name,
    required this.email,
    required this.weight,
    required this.height,
    required this.gender,
    required this.age,
    required this.routineIds,
  });

  factory UserDto.fromFirestore(Map<String, dynamic> data, String id) {
    try {
      return UserDto(
        id: id,
        name: data['name'] as String? ?? 'Nombre no definido',
        email: data['email'] as String? ?? 'Email no definido',
        weight: (data['weight'] as num? ?? 0).toDouble(),
        height: (data['height'] as num? ?? 0).toDouble(),
        gender: data['gender'] as String? ?? 'Genero no definido',
        age: data['age'] as int? ?? 0,
        routineIds: List<String>.from(data['routineIds'] ?? []),
      );
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'weight': weight,
      'height': height,
      'gender': gender,
      'age': age,
      'routineIds': routineIds,
    };
  }
}
