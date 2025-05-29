import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

abstract class AuthRepository {
  //Registrar nuevo usuario con email y contraseña en auth
  Future<User?> signUpWithEmailAndPassword(String email, String password);
  //Iniciar sesion con usuario en auth
  Future<void> signInWithEmailAndPassword(String email, String password);
  //Cerrar sesion con usuario en auth
  Future<void> signOut();
  //Leer usuario actual de la sesion activa en auth
  Future<User?> getCurrentUser();
}
