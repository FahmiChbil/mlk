import 'package:dartz/dartz.dart';
import 'package:mlk/core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> register(String? email, String? password);
  Future<Either<Failure, Unit>> logIn(String? email, String? password);
}
