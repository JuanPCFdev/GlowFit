import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/get_auth_state_changes_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_in_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_out_use_case.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_up_auth_use_case.dart';
import 'package:glow_fit_app/features/gym/presentation/cubits/auth/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInWithEmailUseCase _signInUseCase;
  final SignUpAuthUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final GetAuthStateChangesUseCase _getAuthStateChangesUseCase;
  bool _isRegistering = false;
  bool _isInitialized = false;

  AuthCubit({
    required SignInWithEmailUseCase signInUseCase,
    required SignUpAuthUseCase signUpUseCase,
    required SignOutUseCase signOutUseCase,
    required GetAuthStateChangesUseCase getAuthStateChangesUseCase,
  }) : _signInUseCase = signInUseCase,
       _signUpUseCase = signUpUseCase,
       _signOutUseCase = signOutUseCase,
       _getAuthStateChangesUseCase = getAuthStateChangesUseCase,
       super(AuthInitial());

  void initialize() {
    if (!_isInitialized) {
      print('AuthCubit: Inicializando');
      _isInitialized = true;
      emit(AuthLoading());
      _getAuthStateChangesUseCase().listen((result) {
        print(
          'AuthCubit: Cambio en estado de autenticación: ${result.isSuccess}',
        );
        if (result.isSuccess) {
          final user = result.data;
          if (user != null && !_isRegistering) {
            print('AuthCubit: Usuario autenticado en initialize');
            emit(AuthAuthenticated(user));
          } else if (user == null) {
            print('AuthCubit: Usuario no autenticado en initialize');
            emit(AuthUnauthenticated());
          }
        } else if (!_isRegistering) {
          print('AuthCubit: Error en initialize: ${result.error}');
          emit(
            AuthError(
              result.error ?? 'Error desconocido en el estado de autenticación',
            ),
          );
        }
      });
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      print('AuthCubit: Iniciando signIn');
      emit(AuthLoading());
      final result = await _signInUseCase.execute(email, password);
      print('AuthCubit: Resultado del signIn: ${result.isSuccess}');

      if (result.isSuccess && result.data != null) {
        print('AuthCubit: Usuario autenticado exitosamente');
        emit(AuthAuthenticated(result.data!));
      } else {
        print('AuthCubit: Error en signIn: ${result.error}');
        emit(AuthError(result.error ?? 'Error al iniciar sesión'));
      }
    } catch (e) {
      print('AuthCubit: Error inesperado en signIn: $e');
      emit(AuthError('Error inesperado al iniciar sesión: ${e.toString()}'));
    }
  }

  Future<void> signUp(String email, String password, String name) async {
    try {
      _isRegistering = true;
      emit(AuthLoading());
      final result = await _signUpUseCase.signUp(email, password, name);

      if (result.isSuccess) {
        final user = result.data;
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthError('No se pudo obtener el usuario después del registro'));
        }
      } else {
        emit(AuthError(result.error ?? 'Error al registrar usuario'));
      }
    } catch (e) {
      emit(AuthError('Error inesperado al registrar usuario: ${e.toString()}'));
    } finally {
      _isRegistering = false;
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      final result = await _signOutUseCase.execute();

      if (result.isSuccess) {
        emit(AuthUnauthenticated());
      } else {
        emit(AuthError(result.error ?? 'Error al cerrar sesión'));
      }
    } catch (e) {
      emit(AuthError('Error inesperado al cerrar sesión: ${e.toString()}'));
    }
  }
}
