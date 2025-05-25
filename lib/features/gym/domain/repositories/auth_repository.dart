import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

abstract class AuthRepository {
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<User?> getCurrentUser();
}
