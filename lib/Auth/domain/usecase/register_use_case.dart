import 'package:dartz/dartz.dart';
import 'package:mlk/Auth/domain/repositories/user_repository.dart';
import 'package:mlk/core/error/failures.dart';

class RegisterUseCase {
  final UserRepository userRepository;

  RegisterUseCase(this.userRepository);

  Future<Either<Failure, Unit>> call(String? email, String? password) async {
    return await userRepository.register(email, password);
  }
}
