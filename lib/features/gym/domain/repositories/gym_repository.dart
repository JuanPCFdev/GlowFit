import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';
import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

abstract class GymRepository {
  //Create User
  Future<User> registerUser(String email, String password);
  //Read User
  Future<User> getUser(String userId);
  //Update User
  Future<void> updateUser(UserDto user);
  //Delete User
  Future<void> deleteUser(String userId);

  //Create Routine
  Future<void> saveRoutine(Routine routine);

  //Read Routine
  Future<Routine> getRoutine(String routineId);

  //Update Routine
  Future<void> updateRoutine(Routine routine);

  //Delete Routine
  Future<void> deleteRoutine(String routineId);
}
