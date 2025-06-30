import 'package:blog_app_flutter/Core/Failure/error.dart';
import 'package:blog_app_flutter/Features/Auth/Domain/Entity/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<Either<Failure, User>> logInWithEmailPassword({
    required String email,
    required String password,
  });
}