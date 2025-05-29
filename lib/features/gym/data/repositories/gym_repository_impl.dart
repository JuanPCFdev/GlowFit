import 'package:glow_fit_app/features/gym/data/datasources/remote/auth_data_source.dart';
import 'package:glow_fit_app/features/gym/data/datasources/remote/gym_data_source.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/routine_mapper.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/user_mapper.dart';
import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class GymRepositoryImpl implements GymRepository {
  final GymDataSource _gymDataSource;
  final AuthDataSource _dataSource;

  GymRepositoryImpl(this._gymDataSource, this._dataSource);

  //Create User
  @override
  Future<User> registerUser(String email, String password) async {
    final credential = await _dataSource.signUpWithEmailAndPassword(
      email,
      password,
    );

    final dto = UserDto(
      id: credential.user!.uid,
      name: "unknow",
      email: email,
      weight: 0.0,
      height: 0.0,
      gender: "other",
      age: 0,
      routineIds: [],
    );

    await _gymDataSource.saveUser(dto);
    return UserMapper.toDomain(dto);
  }

  //Read User
  @override
  Future<User> getUser(String userId) async {
    final dto = await _gymDataSource.getUser(userId);
    return UserMapper.toDomain(dto);
  }

  //Update User
  @override
  Future<void> updateUser(UserDto user) async {
    await _gymDataSource.updateUser(user);
  }

  //Delete User
  @override
  Future<void> deleteUser(String userId) async {
    await _gymDataSource.deleteUser(userId);
  }

  //Create Routine
  @override
  Future<void> saveRoutine(Routine routine) async {
    await _gymDataSource.saveRoutine(RoutineMapper.toDTO(routine));
  }

  //Read Routine
  @override
  Future<Routine> getRoutine(String routineId) async {
    final dto = await _gymDataSource.getRoutine(routineId);
    return RoutineMapper.toDomain(dto);
  }

  //Update Routine
  @override
  Future<void> updateRoutine(Routine routine) async {
    await _gymDataSource.updateRoutine(RoutineMapper.toDTO(routine));
  }

  //Delete Routine
  @override
  Future<void> deleteRoutine(String routineId) async {
    await _gymDataSource.deleteRoutine(routineId);
  }
}
