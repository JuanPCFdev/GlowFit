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

  //Eliminar Usuario y sus rutinas
  Future<void> deleteUser(String userId) async {
    final userDocRef = _firestore.collection(userCollectionPath).doc(userId);
    final userDoc = await userDocRef.get();

    if (!userDoc.exists) return;

    final routineIds = (userDoc.data()?['routineIds'] as List<String>?) ?? [];

    final routineDeletions =
        routineIds
            .map(
              (id) =>
                  _firestore.collection(routineCollectionPath).doc(id).delete(),
            )
            .toList();

    await Future.wait([userDocRef.delete(), ...routineDeletions]);
  }

  //CRUD RUTINA
  //Crear una rutina
  Future<void> saveRoutine(RoutineDto routine) async {
    await _firestore
        .collection(routineCollectionPath)
        .doc(routine.id)
        .set(routine.toFirestore());
  }

  //Leer una rutina
  Future<RoutineDto> getRoutine(String routineId) async {
    final doc =
        await _firestore.collection(routineCollectionPath).doc(routineId).get();
    if (doc.data() == null || !doc.exists) {
      throw Exception('Routine not found with id $routineId');
    }
    return RoutineDto.fromFirestore(doc.data()!, doc.id);
  }

  //Leer todas las rutinas del usuario
  Future<List<RoutineDto>> getUserRoutines(String userId) async {
    final user =
        await _firestore.collection(userCollectionPath).doc(userId).get();

    if (!user.exists || user.data() == null) {
      throw Exception('User not found with id $userId');
    }

    final routineIds = (user.data()?['routineIds'] as List<String>?) ?? [];

    final routines = await Future.wait(
      routineIds.map(
        (id) => _firestore.collection(routineCollectionPath).doc(id).get(),
      ),
    );

    final validRoutines =
        routines
            .where((doc) => doc.exists && doc.data() != null)
            .map((doc) => RoutineDto.fromFirestore(doc.data()!, doc.id))
            .toList();

    return validRoutines;
  }

  //Actualizar una rutina
  Future<void> updateRoutine(RoutineDto routine) async {
    await _firestore
        .collection(routineCollectionPath)
        .doc(routine.id)
        .update(routine.toFirestore());
  }

  //Eliminar una rutina
  Future<void> deleteRoutine(String routineId) async {
    await _firestore.collection(routineCollectionPath).doc(routineId).delete();
  }

  //Leer un ejercicio de rutina
  Future<ExerciseDto> getSingleRoutineExercise(
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

  //Leer todos los ejercicios de una rutina
  Future<List<ExerciseDto>> getAllRoutineExercises(String routineId) async {
    final doc =
        await _firestore.collection(routineCollectionPath).doc(routineId).get();
    if (!doc.exists || doc.data() == null) {
      throw Exception('Routine not found with id $routineId');
    }
    final routine = RoutineDto.fromFirestore(doc.data()!, doc.id);
    return routine.exercises;
  }

  //Editar ejercicio de la rutina
  Future<void> updateRoutineExercise(
    ExerciseDto exercise,
    String routineId,
  ) async {
    final routineRef = _firestore
        .collection(routineCollectionPath)
        .doc(routineId);

    await routineRef.update({
      'exercises': FieldValue.arrayRemove([exercise.id]),
    });

    await routineRef.update({
      'exercises': FieldValue.arrayUnion([exercise.toFirestore()]),
    });
  }

  //Eliminar ejercicio de la rutina
  Future<void> deleteExerciseFromRoutine(
    String routineId,
    String exerciseId,
  ) async {
    final routineRef = _firestore
        .collection(routineCollectionPath)
        .doc(routineId);

    await routineRef.update({
      'exercises': FieldValue.arrayRemove([
        {'id': exerciseId},
      ]),
    });
  }
}
