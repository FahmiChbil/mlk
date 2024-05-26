import 'package:dartz/dartz.dart';
import 'package:mlk/Auth/domain/repositories/user_repository.dart';
import 'package:mlk/core/error/failures.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase(this.userRepository);

  Future<Either<Failure, Unit>> call(String? email, String? password) async {
    return await userRepository.logIn(email, password);
  }
}
