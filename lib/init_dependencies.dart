import 'dart:ffi';

import 'package:blog_app_flutter/Features/Auth/Data/Datasources/auth_remote_data_source.dart';
import 'package:blog_app_flutter/Features/Auth/Data/Repository/auth_repsitory_impl.dart';
import 'package:blog_app_flutter/Features/Auth/Domain/UseCases/user_sign_up.dart';
import 'package:blog_app_flutter/Features/Auth/Presentation/Bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'Core/secrets/app_secrets.dart';
import 'Features/Auth/Domain/repository/auth_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
  return;
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(authRepository: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(userSignUp: serviceLocator()),
  );
}
