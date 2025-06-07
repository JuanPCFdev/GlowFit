import 'package:get_it/get_it.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/get_auth_user_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_out_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_in_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_up_auth_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/get_auth_state_changes_use_case.dart';
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
  final getIt = GetIt.I;

  // Auth Use Cases
  getIt.registerLazySingleton(() => SignUpAuthUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
    () => GetAuthUserUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(
    () => SignInWithEmailUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton(() => SignOutUseCase(getIt<AuthRepository>()));
  getIt.registerLazySingleton(
    () => GetAuthStateChangesUseCase(getIt<AuthRepository>()),
  );

  // User Use Cases
  getIt.registerLazySingleton(
    () => RegisterUserUseCase(getIt<GymRepository>()),
  );
  getIt.registerLazySingleton(() => GetUserUseCase(getIt<GymRepository>()));
  getIt.registerLazySingleton(() => UpdateUserUseCase(getIt<GymRepository>()));
  getIt.registerLazySingleton(() => DeleteUserUseCase(getIt<GymRepository>()));

  // Routine Use Cases
  getIt.registerLazySingleton(() => SaveRoutineUseCase(getIt<GymRepository>()));
  getIt.registerLazySingleton(() => GetRoutineUseCase(getIt<GymRepository>()));
  getIt.registerLazySingleton(
    () => UpdateRoutineUseCase(getIt<GymRepository>()),
  );
  getIt.registerLazySingleton(
    () => DeleteRoutineUseCase(getIt<GymRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetRoutineExerciseUseCase(getIt<GymRepository>()),
  );
  getIt.registerLazySingleton(
    () => GetUserRoutinesUseCase(getIt<GymRepository>()),
  );
}
