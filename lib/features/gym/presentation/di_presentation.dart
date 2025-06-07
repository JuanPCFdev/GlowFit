import 'package:get_it/get_it.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/get_auth_state_changes_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_in_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_out_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_up_auth_use_case.dart';
import 'package:glow_fit_app/features/gym/presentation/cubits/auth/auth_cubit.dart';
import 'package:glow_fit_app/features/gym/presentation/cubits/auth/register_cubit.dart';

void setupPresentationDependencies() {
  final getIt = GetIt.I;

  // Auth Cubit
  getIt.registerFactory(
    () => AuthCubit(
      signInUseCase: getIt<SignInWithEmailUseCase>(),
      signUpUseCase: getIt<SignUpAuthUseCase>(),
      signOutUseCase: getIt<SignOutUseCase>(),
      getAuthStateChangesUseCase: getIt<GetAuthStateChangesUseCase>(),
    ),
  );

  // Register Cubit
  getIt.registerFactory(
    () => RegisterCubit(signUpUseCase: getIt<SignUpAuthUseCase>()),
  );
}
