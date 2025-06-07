import 'package:glow_fit_app/features/gym/data/datasources/remote/auth_data_source.dart';
import 'package:glow_fit_app/features/gym/data/datasources/remote/gym_data_source.dart';
import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/routine_exercise_mapper.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/routine_mapper.dart';
import 'package:glow_fit_app/features/gym/data/remote/mappers/user_mapper.dart';
import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';
import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

class GymRepositoryImpl implements GymRepository {
  final GymDataSource _gymDataSource;
  final AuthDataSource _dataSource;

  GymRepositoryImpl(this._gymDataSource, this._dataSource);

  //Crear usuario
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

  //Leer Usuario
  @override
  Future<User> getUser(String userId) async {
    final dto = await _gymDataSource.getUser(userId);
    return UserMapper.toDomain(dto);
  }

  //Actualizar usuario
  @override
  Future<void> updateUser(UserDto user) async {
    await _gymDataSource.updateUser(user);
  }

  //Eliminar usuario
  @override
  Future<void> deleteUser(String userId) async {
    //Eliminamos el usuario del firestore
    await _gymDataSource.deleteUser(userId);
    //Eliminamos el usuario del auth
    await _dataSource.deleteUser();
    //Cerramos la sesion
    await _dataSource.signOut();
  }

  //Crear Rutina
  @override
  Future<void> saveRoutine(Routine routine) async {
    await _gymDataSource.saveRoutine(RoutineMapper.toDTO(routine));
  }

  //Leer una Rutina
  @override
  Future<Routine> getRoutine(String routineId) async {
    final dto = await _gymDataSource.getRoutine(routineId);
    return RoutineMapper.toDomain(dto);
  }

  //Leer varias rutinas
  @override
  Future<List<Routine>> getAllUserRoutines(String userId) async {
    final routines = await _gymDataSource.getUserRoutines(userId);
    return routines.map((e) => RoutineMapper.toDomain(e)).toList();
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

  //Leer un solo ejercicio
  @override
  Future<RoutineExercise> getRoutineExercise(
    String routineId,
    String exerciseId,
  ) async {
    final exercise = await _gymDataSource.getSingleRoutineExercise(
      routineId,
      exerciseId,
    );
    return RoutineExerciseMapper.toDomain(exercise);
  }

  //Leer todos los ejercicios
  @override
  Future<List<RoutineExercise>> getRoutineExercises(String routineId) async {
    final exercises = await _gymDataSource.getAllRoutineExercises(routineId);
    return exercises.map((e) => RoutineExerciseMapper.toDomain(e)).toList();
  }

  //Editar Ejercicio de rutina
  @override
  Future<void> updateRoutineExercise(
    RoutineExercise exercise,
    String routineId,
  ) async {
    final exerciseDto = RoutineExerciseMapper.toDto(exercise);
    await _gymDataSource.updateRoutineExercise(exerciseDto, routineId);
  }

  //Eliminar ejercicio
  @override
  Future<void> deleteRoutineExercise(
    String routineId,
    String exerciseId,
  ) async {
    await _gymDataSource.deleteExerciseFromRoutine(routineId, exerciseId);
  }
}
