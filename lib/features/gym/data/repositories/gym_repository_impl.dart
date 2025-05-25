import 'package:glow_fit_app/features/gym/data/datasources/remote/gym_data_source.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/routine_mapper.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/user_mapper.dart';
import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class GymRepositoryImpl implements GymRepository {
  final GymDataSource _gymDataSource;

  GymRepositoryImpl(this._gymDataSource);

  @override
  Future<User> getUser(String userId) async {
    final dto = await _gymDataSource.getUser(userId);
    return UserMapper.toDomain(dto);
  }

  @override
  Future<void> saveUser(User user) async {
    await _gymDataSource.saveUser(UserMapper.toDto(user));
  }

  @override
  Future<Routine> getRoutine(String routineId) async {
    final dto = await _gymDataSource.getRoutine(routineId);
    return RoutineMapper.toDomain(dto);
  }

  @override
  Future<void> saveRoutine(Routine routine) async {
    await _gymDataSource.saveRoutine(RoutineMapper.toDTO(routine));
  }
}
