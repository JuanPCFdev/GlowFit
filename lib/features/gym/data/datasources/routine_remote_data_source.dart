import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glow_fit_app/features/gym/data/models/routine_model.dart';

class RoutineRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Obtener rutinas de un usuario
  Future<List<RoutineModel>> getRoutines(String userId) async {
    final querySnapshot = await _firestore.collection('users').doc(userId).collection('routines').get();
    return querySnapshot.docs.map((doc) => RoutineModel.fromFirestore(doc)).toList();
  }

}