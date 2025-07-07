import 'package:fpdart/fpdart.dart';

import '../../../../Core/Failure/error.dart';
import '../../../../Core/UseCase/use_case.dart';
import '../Entity/user.dart';
import '../repository/auth_repository.dart';

class UserSignIn implements UseCase<User, UserSignInParams> {
  final AuthRepository authRepository;

  UserSignIn({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.logInWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({required this.email, required this.password});
}
