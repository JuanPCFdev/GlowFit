
import 'package:cloud_firestore/cloud_firestore.dart';

class RoutineModel {
  final String id;
  final String userId; // Para relacionar con el usuario
  final String name;
  final String description;
  final String dayOfWeek;

// Nota: Los ejercicios se obtienen de la subcolección "exercises", no se incluyen aquí.
// Si necesitas cargar ejercicios con la rutina, hazlo en una consulta separada.

RoutineModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.description,
    required this.dayOfWeek,
  });

  // Desde Firestore
  factory RoutineModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return RoutineModel(
      id: doc.id,
      userId: doc.reference.parent.parent?.id ?? '', // Obtiene el userId de la jerarquía users/{userId}/routines
      name: data['name'] ?? 'Sin nombre',
      description: data['description'] ?? '',
      dayOfWeek: data['dayOfWeek'] ?? 'lunes',
    );
  }

  // Para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'dayOfWeek': dayOfWeek,
    };
  }

}