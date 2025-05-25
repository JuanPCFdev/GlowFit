import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:glow_fit_app/features/gym/domain/mappers/user_mapper.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

class AuthDataSource {
  final firebase.FirebaseAuth _auth = firebase.FirebaseAuth.instance;

  //To get the current user
  Future<User?> getCurrentUser() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;
    return UserMapper.fromFirebase(firebaseUser);
  }

  //To create a new user
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithEmail(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async => await _auth.signOut();
}
