import 'package:glow_fit_app/features/gym/data/remote/dto/user_dto.dart';
import 'package:glow_fit_app/features/gym/domain/entities/exercise.dart';
import 'package:glow_fit_app/features/gym/domain/entities/routine.dart';
import 'package:glow_fit_app/features/gym/domain/entities/user.dart';

abstract class GymRepository {
  ///CRUD USER OPERATIONS
  //Crear usuario de tipo entity, no auth
  Future<User> registerUser(String email, String password);
  //Leer usuario entity con el id
  Future<User> getUser(String userId);
  //Actualizar usuario entity
  Future<void> updateUser(UserDto user);
  //Eliminar usuario entity --> Tambien hay que eliminar sus rutinas y el usuario de auth.
  Future<void> deleteUser(String userId);

  ///CRUD ROUTINE OPERATIONS
  //Crear rutina
  Future<void> saveRoutine(Routine routine);

  //Leer una rutina
  Future<Routine> getRoutine(String routineId);

  //Leer varias rutinas
  Future<List<Routine>> getAllUserRoutines(String userId);

  //Actualizar rutina
  Future<void> updateRoutine(Routine routine);

  //Eliminar rutina
  Future<void> deleteRoutine(String routineId);

  ///CRUD EXERCISE OPERATIONS
  //Leer un ejercicio
  Future<RoutineExercise> getRoutineExercise(
    String routineId,
    String exerciseId,
  );

  //Leer todos los ejercicios
  Future<List<RoutineExercise>> getRoutineExercises(String routineId);

  //Editar Ejercicio de rutina
  Future<void> updateRoutineExercise(
    RoutineExercise exercise,
    String routineId,
  );

  //Eliminar ejercicio de rutina
  Future<void> deleteRoutineExercise(String routineId, String exerciseId);
}
