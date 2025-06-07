import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

/// Resultado de una operación de autenticación
class AuthResult<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  const AuthResult._({this.data, this.error, required this.isSuccess});

  factory AuthResult.success(T data) {
    return AuthResult._(data: data, isSuccess: true);
  }

  factory AuthResult.error(String error) {
    return AuthResult._(error: error, isSuccess: false);
  }
}

/// Repositorio que maneja todas las operaciones de autenticación
abstract class AuthRepository {
  /// Registra un nuevo usuario con email y contraseña
  /// Retorna [AuthResult] con el usuario creado o un error si falla
  Future<AuthResult<User>> signUpWithEmailAndPassword(
    String email,
    String password,
    String? name,
  );

  /// Inicia sesión con email y contraseña
  /// Retorna [AuthResult] con el usuario autenticado o un error si falla
  Future<AuthResult<User>> signInWithEmailAndPassword(
    String email,
    String password,
  );

  /// Cierra la sesión actual
  ///
  /// Retorna [AuthResult] indicando si la operación fue exitosa
  Future<AuthResult<void>> signOut();

  /// Obtiene el usuario actual de la sesión activa
  ///
  /// Retorna [AuthResult] con el usuario actual o null si no hay sesión
  Future<AuthResult<User?>> getCurrentUser();

  /// Stream de cambios en el estado de autenticación
  ///
  /// Emite [AuthResult] con el usuario cuando hay cambios en la autenticación
  Stream<AuthResult<User?>> authStateChanges();
}
