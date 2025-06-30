


// class UserSignUpImplementation implements UseCase {
//
// }

import 'package:blog_app_flutter/Core/Failure/error.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}


class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({required this.email, required this.password, required this.name});
}