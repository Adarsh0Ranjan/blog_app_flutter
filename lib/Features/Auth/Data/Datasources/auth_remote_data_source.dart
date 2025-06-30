import 'package:blog_app_flutter/Core/Failure/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<String> logInWithEmailPassword({
    required String email,
    required String password
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<String> logInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user != null) {
        return user.id;
      } else {
        throw ServerExceptions('Login failed: User is null');
      }
    } catch (e) {
      throw ServerExceptions('Login failed: $e');
    }
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name, // store name in user metadata
        },
      );

      final user = response.user;
      if (user != null) {
        return user.id;
      } else {
        throw ServerExceptions('Signup failed: User is null');
      }
    } catch (e) {
      throw ServerExceptions('Signup failed: $e');
    }
  }
}
