import 'package:bloc/bloc.dart';
import 'package:blog_app_flutter/Core/UseCase/use_case.dart';
import 'package:blog_app_flutter/Features/Auth/Domain/UseCases/user_sign_up.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({required UserSignUp userSignUp})
    : _userSignUp = userSignUp,
      super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUp.call(UserSignUpParams(email: event.email, password: event.password, name: event.name));
      
      res.fold((failure) => emit(AuthFailure(failure.message)), (success) => emit(AuthSuccess(success)));
    });
  }
}


