import 'package:glow_fit_app/features/gym/data/datasources/remote/auth_data_source.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/user_mapper.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/data/datasources/remote/gym_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;
  final GymDataSource _userDataSource;

  AuthRepositoryImpl(this._dataSource, this._userDataSource);
  //Registrar usuario en auth
  @override
  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await _dataSource.signUpWithEmailAndPassword(email, password);
    return await getCurrentUser();
  }

  //Iniciar sesion con usuario en auth
  @override
  Future<void> signInWithEmailAndPassword(String email, String password) =>
      _dataSource.signInWithEmailAndPassword(email, password);
  //Cerrar sesion en auth
  @override
  Future<void> signOut() => _dataSource.signOut();
  //Leer usuario de sesion activa en auth
  @override
  Future<User?> getCurrentUser() async {
    final firebaseUser = await _dataSource.getCurrentUser();
    if (firebaseUser == null) {
      return null;
    }
    try {
      final userDto = await _userDataSource.getUser(firebaseUser.uid);
      final user = UserMapper.toDomain(userDto);
      return user;
    } catch (e) {
      return null;
    }
  }
}
