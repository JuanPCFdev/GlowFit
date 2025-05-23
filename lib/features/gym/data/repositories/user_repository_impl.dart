import 'package:glow_fit_app/features/gym/data/datasources/user_local_data_source.dart';
import 'package:glow_fit_app/features/gym/data/datasources/user_remote_data_source.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<User> getCurrentUser() async {
    try {
      final userModel = await remoteDataSource.getUser();
      await localDataSource.cacheUser(userModel);
      return userModel.toEntity();
    } catch (e) {
      return localDataSource.getLastUser();
    }
  }

  @override
  Future<void> updateUser(User user) {
    throw UnimplementedError();
  }
}
