import 'package:glow_fit_app/features/gym/data/datasources/remote/auth_data_source.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) =>
      _dataSource.signUpWithEmailAndPassword(email, password);

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) =>
      _dataSource.signInWithEmail(email, password);

  @override
  Future<void> signOut() => _dataSource.signOut();

  @override
  Future<User?> getCurrentUser() => _dataSource.getCurrentUser();
}
