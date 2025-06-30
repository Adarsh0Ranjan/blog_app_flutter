import 'package:blog_app_flutter/Core/Failure/error.dart';
import 'package:blog_app_flutter/Core/Failure/exceptions.dart';
import 'package:blog_app_flutter/Features/Auth/Data/Datasources/auth_remote_data_source.dart';
import 'package:blog_app_flutter/Features/Auth/Domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> logInWithEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userID = await remoteDataSource.signUpWithEmailPassword(
        email: email,
        password: password,
        name: name,
      );
      return right(userID);
    } on ServerExceptions catch (e) {
      return left(Failure(e.message));
    }
  }
}
