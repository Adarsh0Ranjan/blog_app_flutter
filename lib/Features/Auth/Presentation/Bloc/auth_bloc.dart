import 'package:bloc/bloc.dart';
import 'package:blog_app_flutter/Features/Auth/Domain/Entity/user.dart';
import 'package:blog_app_flutter/Features/Auth/Domain/UseCases/user_sign_up.dart';
import 'package:meta/meta.dart';

import '../../Domain/UseCases/user_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;

  AuthBloc({required UserSignUp userSignUp, required UserSignIn userSignIn})
    : _userSignUp = userSignUp,
      _userSignIn = userSignIn,
      super(AuthInitial()) {
    // Handle sign-up event
    on<AuthSignUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignUp.call(
        UserSignUpParams(
          email: event.email,
          password: event.password,
          name: event.name,
        ),
      );
      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (success) => emit(AuthSuccess(success)),
      );
    });

    // Handle login event
    on<AuthLogin>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSignIn.call(
        UserSignInParams(email: event.email, password: event.password),
      );
      res.fold(
        (failure) => emit(AuthFailure(failure.message)),
        (success) => emit(AuthSuccess(success)),
      );
    });
  }
}
