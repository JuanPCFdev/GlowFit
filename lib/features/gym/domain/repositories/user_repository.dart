import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

abstract class UserRepository {
  //CRUD
  Future<void> createUser(User user);
  Future<User> getUser(String userId);
  Future<void> updateUser(User user);
  Future<void> deleteUser(String userId);
}
