import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class RegisterFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class LoginFailure extends Failure {
  @override
  List<Object?> get props => [];
}
