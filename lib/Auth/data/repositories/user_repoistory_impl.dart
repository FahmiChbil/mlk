import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mlk/Auth/data/datasources/user_remote_data_source.dart';
import 'package:mlk/Auth/domain/repositories/user_repository.dart';
import 'package:mlk/core/error/exception.dart';
import 'package:mlk/core/error/failures.dart';
import 'package:network_info_plus/network_info_plus.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSourceImpl userRemoteDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> logIn(String? email, String? password) async {
    try {
      await userRemoteDataSource.logIn(email, password);

      return right(unit);
    } on ServerException {
      return left(ServerFailure());
    } on FirebaseAuthException {
      return left(LoginFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> register(
      String? email, String? password) async {
    try {
      await userRemoteDataSource.register(email, password);

      return right(unit);
    } on ServerException {
      return left(ServerFailure());
    } on FirebaseAuthException {
      return left(RegisterFailure());
    }
  }
}
