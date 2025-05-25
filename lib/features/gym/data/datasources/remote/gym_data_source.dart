import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/routine_dto.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';

class GymDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserDto> getUser(String userId) async {
    final doc = await _firestore.collection('users').doc(userId).get();
    return UserDto.fromFirestore(doc.data()!, doc.id);
  }

  Future<void> saveUser(UserDto user) async {
    await _firestore.collection('users').doc(user.id).set(user.toFirestore());
  }

  Future<RoutineDto> getRoutine(String routineId) async {
    final doc = await _firestore.collection('routines').doc(routineId).get();
    return RoutineDto.fromFirestore(doc.data()!, doc.id);
  }

  Future<void> saveRoutine(RoutineDto routine) async {
    await _firestore
        .collection('routines')
        .doc(routine.id)
        .set(routine.toFirestore());
  }
}
