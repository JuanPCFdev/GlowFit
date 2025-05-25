import 'package:get_it/get_it.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/get_current_user.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_out.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_up_with_email.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_in_with_email.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/gym/get_routine.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/gym/get_user.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/gym/save_routine.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/gym/save_user.dart';

void setupDomainDependencies() {
  //Auth Use Cases
  GetIt.I.registerLazySingleton(
    () => SignUpWithEmailUseCase(GetIt.I<AuthRepository>()),
  );
  GetIt.I.registerLazySingleton(
    () => SignInWithEmailUseCase(GetIt.I<AuthRepository>()),
  );
  GetIt.I.registerLazySingleton(
    () => SignOutUseCase(GetIt.I<AuthRepository>()),
  );
  GetIt.I.registerLazySingleton(
    () => GetCurrentUserUseCase(GetIt.I<AuthRepository>()),
  );

  //Gym UseCases
  GetIt.I.registerLazySingleton(
    () => SaveUserUseCase(GetIt.I<GymRepository>()),
  );
  GetIt.I.registerLazySingleton(() => GetUserUseCase(GetIt.I<GymRepository>()));
  GetIt.I.registerLazySingleton(
    () => SaveRoutineUseCase(GetIt.I<GymRepository>()),
  );
  GetIt.I.registerLazySingleton(
    () => GetRoutineUseCase(GetIt.I<GymRepository>()),
  );
}
