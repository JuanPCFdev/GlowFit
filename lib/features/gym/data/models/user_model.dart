
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final double weight;
  final double height;
  final String gender;
  final int age;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.weight,
    required this.height,
    required this.gender,
    required this.age,
  });

  // Desde Firestore
  factory UserModel.fromFirestore(DocumentSnapshot doc) {

    if (!doc.exists) {
      throw Exception('El usuario no existe en Firestore');
    }

    final data = doc.data();

    if (data == null) {
      throw Exception('Los datos del usuario están vacíos');
    }

    // Cast seguro usando 'as?' y verificación de tipos
    final userData = data as Map<String, dynamic>? ?? {};

   return UserModel(
    id: doc.id,
    name: userData['name'] ?? 'Nombre no definido',
    email: userData['email'] ?? '',
    weight: (userData['weight'] as num?)?.toDouble() ?? 0.0,
    height: (userData['height'] as num?)?.toDouble() ?? 0.0,
    gender: userData['gender'] ?? 'other',
    age: userData['age'] ?? 0,
    );
  }

  // Para Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'weight': weight,
      'height': height,
      'gender': gender,
      'age': age,
    };
  }
  
}