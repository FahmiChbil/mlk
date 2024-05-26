part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class RegisterSuccesState extends AuthState {
  const RegisterSuccesState();
}

class RegisterFailedState extends AuthState {
  final String error;
  const RegisterFailedState({required this.error});
}

class LoginSuccesState extends AuthState {
  const LoginSuccesState();
}

class LoginFailedState extends AuthState {
  final String error;
  const LoginFailedState({required this.error});
}
