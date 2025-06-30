import 'package:blog_app_flutter/Core/Failure/error.dart';
import 'package:blog_app_flutter/Core/UseCase/use_case.dart';
import 'package:blog_app_flutter/Features/Auth/Domain/Entity/user.dart';
import 'package:blog_app_flutter/Features/Auth/Domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  UserSignUp({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    // TODO: implement call
   return await authRepository.signUpWithEmailPassword(email: params.email, password: params.password, name: params.name);
  }
}