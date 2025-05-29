import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/routine_dto.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';

class GymDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final userCollectionPath = 'users';
  final routineCollectionPath = 'routines';

  //USER CRUD
  //Crear usuario
  Future<void> saveUser(UserDto user) async {
    await _firestore
        .collection(userCollectionPath)
        .doc(user.id)
        .set(user.toFirestore());
  }

  //Leer usuario
  Future<UserDto> getUser(String userId) async {
    final doc =
        await _firestore.collection(userCollectionPath).doc(userId).get();
    return UserDto.fromFirestore(doc.data()!, doc.id);
  }

  //Actualizar Usuario
  Future<void> updateUser(UserDto user) async {
    await _firestore
        .collection(userCollectionPath)
        .doc(user.id)
        .update(user.toFirestore());
  }

  //Eliminar Usuario
  Future<void> deleteUser(String userId) async {
    await _firestore.collection(userCollectionPath).doc(userId).delete();
  }

  //CRUD RUTINA
  //Crear Rutina
  Future<void> saveRoutine(RoutineDto routine) async {
    await _firestore
        .collection(routineCollectionPath)
        .doc(routine.id)
        .set(routine.toFirestore());
  }

  //Leer Rutina
  Future<RoutineDto> getRoutine(String routineId) async {
    final doc =
        await _firestore.collection(routineCollectionPath).doc(routineId).get();
    return RoutineDto.fromFirestore(doc.data()!, doc.id);
  }

  //Actualizar Rutina
  Future<void> updateRoutine(RoutineDto routine) async {
    await _firestore
        .collection(routineCollectionPath)
        .doc(routine.id)
        .update(routine.toFirestore());
  }

  //Eliminar Rutina
  Future<void> deleteRoutine(String routineId) async {
    await _firestore.collection(routineCollectionPath).doc(routineId).delete();
  }
}
