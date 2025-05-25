import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

abstract class GymRepository {
  Future<User> getUser(String userId);
  Future<void> saveUser(User user);
  Future<Routine> getRoutine(String routineId);
  Future<void> saveRoutine(Routine routine);
}
