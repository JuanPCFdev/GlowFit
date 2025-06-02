import 'package:get_it/get_it.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/get_auth_user_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_out_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_in_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_up_auth_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/delete_routine_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/get_routine_exercise_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/get_routine_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/get_data_user_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/get_user_routines_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/save_routine_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/delete_user_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/register_user_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/update_routine_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/user/update_user_use_case.dart';

void setupDomainDependencies() {
  //Sign up
  GetIt.I.registerLazySingleton(
    () => SignUpAuthUseCase(GetIt.I<AuthRepository>()),
  );
  //Get current Auth User
  GetIt.I.registerLazySingleton(
    () => GetAuthUserUseCase(GetIt.I<AuthRepository>()),
  );
  //Sign In with auth user
  GetIt.I.registerLazySingleton(
    () => SignInWithEmailUseCase(GetIt.I<AuthRepository>()),
  );
  //Sign out auth user
  GetIt.I.registerLazySingleton(
    () => SignOutUseCase(GetIt.I<AuthRepository>()),
  );

  //User Use Cases
  //Register User Use Case
  GetIt.I.registerLazySingleton(
    () => RegisterUserUseCase(GetIt.I<GymRepository>()),
  );
  //Get User Use Case
  GetIt.I.registerLazySingleton(() => GetUserUseCase(GetIt.I<GymRepository>()));
  //Update User Use Case
  GetIt.I.registerLazySingleton(
    () => UpdateUserUseCase(GetIt.I<GymRepository>()),
  );
  //Delete User usecase
  GetIt.I.registerLazySingleton(
    () => DeleteUserUseCase(GetIt.I<GymRepository>()),
  );

  //Create Routine Use Case
  GetIt.I.registerLazySingleton(
    () => SaveRoutineUseCase(GetIt.I<GymRepository>()),
  );
  //Get Routine Use Case
  GetIt.I.registerLazySingleton(
    () => GetRoutineUseCase(GetIt.I<GymRepository>()),
  );
  //Update Routine Usecase
  GetIt.I.registerLazySingleton(
    () => UpdateRoutineUseCase(GetIt.I<GymRepository>()),
  );
  //Delete Routine Use Case
  GetIt.I.registerLazySingleton(
    () => DeleteRoutineUseCase(GetIt.I<GymRepository>()),
  );

  //Get Routine Exercise Use Case
  GetIt.I.registerLazySingleton(
    () => GetRoutineExerciseUseCase(GetIt.I<GymRepository>()),
  );

  //Get User Routines Use Case
  GetIt.I.registerLazySingleton(
    () => GetUserRoutinesUseCase(GetIt.I<GymRepository>()),
  );
}
