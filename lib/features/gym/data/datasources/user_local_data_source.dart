import 'package:glow_fit_app/features/gym/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<UserModel> getUser();
  cacheUser(userModel) {}
  Future<UserModel> getLastUser();
}
