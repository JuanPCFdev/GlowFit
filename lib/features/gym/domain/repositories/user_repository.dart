import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

abstract class UserRepository {
  Future<User> getCurrentUser();
  Future<void> updateUser(User user);
}
