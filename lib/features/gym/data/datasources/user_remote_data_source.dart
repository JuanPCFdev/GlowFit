import 'package:glow_fit_app/features/gym/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getLastUser();
  getUser() {}
}
