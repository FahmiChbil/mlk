import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mlk/Auth/domain/usecase/log_in_use_case.dart';
import 'package:mlk/Auth/domain/usecase/register_use_case.dart';
import 'package:mlk/core/const.dart';
import 'package:mlk/core/error/failures.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  AuthCubit({required this.registerUseCase, required this.loginUseCase})
      : super(AuthInitial());

  logIn(String? email, String? password) async {
    final result = await loginUseCase(email, password);

    result.fold(
      (l) => emit(LoginFailedState(error: _mapFailureToMessage(l))),
      (r) => emit(LoginSuccesState()),
    );
  }

  register(String? email, String? password) async {
    final result = await registerUseCase(email, password);

    result.fold(
      (l) => emit(RegisterFailedState(error: _mapFailureToMessage(l))),
      (r) => emit(RegisterSuccesState()),
    );
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case RegisterFailure:
      return REGISTER_FAILURE_MESSAGE;

    default:
      return "Unexpected Error , Please try again later .";
  }
}
