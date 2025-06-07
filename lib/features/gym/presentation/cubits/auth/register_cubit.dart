import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_fit_app/features/gym/domain/usecases/auth/sign_up_auth_use_case.dart';
import 'package:glow_fit_app/features/gym/presentation/cubits/auth/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final SignUpAuthUseCase _signUpUseCase;
  bool _isDisposed = false;

  RegisterCubit({required SignUpAuthUseCase signUpUseCase})
    : _signUpUseCase = signUpUseCase,
      super(RegisterInitial());

  Future<void> register(String email, String password, String name) async {
    if (_isDisposed) return;

    try {
      final result = await _signUpUseCase.signUp(email, password, name);

      if (_isDisposed) return;

      if (result.isSuccess) {
        final user = result.data;
        if (user != null) {
          if (!_isDisposed) emit(RegisterSuccess(user));
        } else {
          if (!_isDisposed) {
            emit(
              RegisterError(
                'No se pudo obtener el usuario después del registro',
              ),
            );
          }
        }
      } else {
        if (!_isDisposed) {
          emit(RegisterError(result.error ?? 'Error al registrar usuario'));
        }
      }
    } catch (e) {
      if (!_isDisposed) {
        emit(
          RegisterError(
            'Error inesperado al registrar usuario: ${e.toString()}',
          ),
        );
      }
    }
  }

  @override
  Future<void> close() {
    _isDisposed = true;
    return super.close();
  }
}
