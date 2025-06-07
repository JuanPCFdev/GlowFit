import 'package:glow_fit_app/features/gym/data/datasources/remote/auth_data_source.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/user_mapper.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/data/datasources/remote/gym_data_source.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;
  final GymDataSource _userDataSource;

  AuthRepositoryImpl(this._dataSource, this._userDataSource);

  @override
  Future<AuthResult<User>> signUpWithEmailAndPassword(
    String email,
    String password,
    String? name,
  ) async {
    try {
      final credential = await _dataSource.signUpWithEmailAndPassword(
        email,
        password,
      );

      if (credential.user == null) {
        return AuthResult.error('No se pudo crear el usuario');
      }

      final userDto = UserDto(
        id: credential.user!.uid,
        name: name ?? 'Usuario',
        email: email,
        weight: 0.0,
        height: 0.0,
        gender: 'other',
        age: 0,
        routineIds: [],
      );

      await _userDataSource.saveUser(userDto);
      return AuthResult.success(UserMapper.toDomain(userDto));
    } catch (e) {
      return AuthResult.error('Error al registrar usuario: ${e.toString()}');
    }
  }

  @override
  Future<AuthResult<User>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      print('AuthRepository: Iniciando signInWithEmailAndPassword');
      final credential = await _dataSource.signInWithEmailAndPassword(
        email,
        password,
      );
      final firebaseUser = credential.user;

      print(
        'AuthRepository: Usuario de Firebase obtenido: ${firebaseUser?.uid}',
      );

      if (firebaseUser == null) {
        print('AuthRepository: Error - Usuario de Firebase es null');
        return AuthResult.error(
          'No se pudo obtener el usuario después del inicio de sesión',
        );
      }

      try {
        print('AuthRepository: Intentando obtener usuario de Firestore');
        final userDto = await _userDataSource.getUser(firebaseUser.uid);
        print('AuthRepository: Usuario obtenido de Firestore exitosamente');
        return AuthResult.success(UserMapper.toDomain(userDto));
      } catch (e) {
        print(
          'AuthRepository: Usuario no encontrado en Firestore, creando nuevo usuario',
        );
        final userDto = UserDto(
          id: firebaseUser.uid,
          name: firebaseUser.displayName ?? 'Usuario',
          email: firebaseUser.email ?? email,
          weight: 0.0,
          height: 0.0,
          gender: 'other',
          age: 0,
          routineIds: [],
        );

        await _userDataSource.saveUser(userDto);
        print('AuthRepository: Nuevo usuario creado en Firestore');
        return AuthResult.success(UserMapper.toDomain(userDto));
      }
    } catch (e) {
      print('AuthRepository: Error en signInWithEmailAndPassword: $e');
      return AuthResult.error('Error al iniciar sesión: ${e.toString()}');
    }
  }

  @override
  Future<AuthResult<void>> signOut() async {
    try {
      await _dataSource.signOut();
      return AuthResult.success(null);
    } catch (e) {
      return AuthResult.error('Error al cerrar sesión: ${e.toString()}');
    }
  }

  @override
  Future<AuthResult<User?>> getCurrentUser() async {
    try {
      final firebaseUser = await _dataSource.getCurrentUser();
      if (firebaseUser == null) {
        return AuthResult.success(null);
      }

      final userDto = await _userDataSource.getUser(firebaseUser.uid);
      final user = UserMapper.toDomain(userDto);
      return AuthResult.success(user);
    } catch (e) {
      return AuthResult.error(
        'Error al obtener el usuario actual: ${e.toString()}',
      );
    }
  }

  @override
  Stream<AuthResult<User?>> authStateChanges() {
    return _dataSource.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser == null) {
        return AuthResult.success(null);
      }

      try {
        final userDto = await _userDataSource.getUser(firebaseUser.uid);
        final user = UserMapper.toDomain(userDto);
        return AuthResult.success(user);
      } catch (e) {
        return AuthResult.error(
          'Error al obtener datos del usuario: ${e.toString()}',
        );
      }
    });
  }
}
