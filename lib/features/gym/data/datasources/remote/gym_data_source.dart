import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/routine_dto.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/exercise_dto.dart';

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

    if (doc.data() == null || !doc.exists) {
      throw Exception('User not found with id $userId');
    }

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
  //Create Routine
  Future<void> saveRoutine(RoutineDto routine) async {
    await _firestore
        .collection(routineCollectionPath)
        .doc(routine.id)
        .set(routine.toFirestore());
  }

  //Get Routine
  Future<RoutineDto> getRoutine(String routineId) async {
    final doc =
        await _firestore.collection(routineCollectionPath).doc(routineId).get();
    if (doc.data() == null || !doc.exists) {
      throw Exception('Routine not found with id $routineId');
    }
    return RoutineDto.fromFirestore(doc.data()!, doc.id);
  }

  //Update Routine
  Future<void> updateRoutine(RoutineDto routine) async {
    await _firestore
        .collection(routineCollectionPath)
        .doc(routine.id)
        .update(routine.toFirestore());
  }

  //Delete Routine
  Future<void> deleteRoutine(String routineId) async {
    await _firestore.collection(routineCollectionPath).doc(routineId).delete();
  }

  //Get Routine Excersise
  Future<ExerciseDto> getRoutineExercises(
    String routineId,
    String exerciseId,
  ) async {
    final doc =
        await _firestore.collection(routineCollectionPath).doc(routineId).get();

    if (!doc.exists || doc.data() == null) {
      throw Exception('Routine not found with id $routineId');
    }

    final routine = RoutineDto.fromFirestore(doc.data()!, doc.id);

    final exercise = routine.exercises.firstWhere(
      (e) => e.id == exerciseId,
      orElse: () => throw Exception('Exercise not found with id $exerciseId'),
    );

    return exercise;
  }

  //Get User Routines
  Future<List<RoutineDto>> getUserRoutines(String userId) async {
    final snapshot =
        await _firestore.collection(userCollectionPath).doc(userId).get();

    if (!snapshot.exists || snapshot.data() == null) {
      throw Exception('User not found with id $userId');
    }

    final userRoutinesIds =
        snapshot.data()!['routineIds'] as List<String>? ?? [];

    final routines = await Future.wait(
      userRoutinesIds.map((routineId) async {
        final doc =
            await _firestore
                .collection(routineCollectionPath)
                .doc(routineId)
                .get();
        if (!doc.exists || doc.data() == null) {
          throw Exception('Routine not found with id $routineId');
        }
        return RoutineDto.fromFirestore(doc.data()!, doc.id);
      }),
    );

    return routines;
  }
}
