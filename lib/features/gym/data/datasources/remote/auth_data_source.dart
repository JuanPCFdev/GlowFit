import 'package:firebase_auth/firebase_auth.dart';

class AuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //To get the current user (return a user of firebase)
  Future<User?> getCurrentUser() async => _auth.currentUser;
  //To register a new user
  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  //Sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  //Sign out
  Future<void> signOut() async => await _auth.signOut();
  //Listen auth changes
  Stream<User?> authStateChanges() => _auth.authStateChanges();
}
