
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:glow_fit_app/features/gym/data/models/user_model.dart';

class UserRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _userPath = 'users';

  //Crear o actualizar usuario
  Future<void> createOrUpdateUser(UserModel user) async {
    await _firestore.collection(_userPath).doc(user.id).set(user.toFirestore());
  }

  //Obtener un usuario por Id
  Future<UserModel> getUser(String userId) async{
    final doc = await _firestore.collection(_userPath).doc(userId).get();
    return UserModel.fromFirestore(doc);
  }
}