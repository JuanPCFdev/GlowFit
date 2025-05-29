import 'package:get_it/get_it.dart';
import 'package:glow_fit_app/features/gym/data/datasources/remote/auth_data_source.dart';
import 'package:glow_fit_app/features/gym/data/datasources/remote/gym_data_source.dart';
import 'package:glow_fit_app/features/gym/data/repositories/auth_repository_impl.dart';
import 'package:glow_fit_app/features/gym/data/repositories/gym_repository_impl.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/auth_repository.dart';
import 'package:glow_fit_app/features/gym/domain/repositories/gym_repository.dart';

void setUpDataDependencies() {
  //Data sources
  GetIt.I.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  GetIt.I.registerLazySingleton<GymDataSource>(() => GymDataSource());

  //AuthRepository
  GetIt.I.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(GetIt.I<AuthDataSource>(), GetIt.I<GymDataSource>()),
  );

  //GymRepository
  GetIt.I.registerLazySingleton<GymRepository>(
    () =>
        GymRepositoryImpl(GetIt.I<GymDataSource>(), GetIt.I<AuthDataSource>()),
  );
}
