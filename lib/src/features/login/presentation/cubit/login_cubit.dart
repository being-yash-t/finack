import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finack/src/core/errors/exceptions.dart';
import 'package:finack/src/core/errors/failures.dart';
import 'package:finack/src/core/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService authService;
  LoginCubit({required this.authService}) : super(LoginInitial());

  void login() async {
    emit(LoggingIn());
    try {
      final result = await authService.signInWithGoogle();
      emit(LoggedIn(result));
    } on ExceptionWithMessage catch (ex) {
      emit(LoginFailed(const NoUserSignedInFailure()));
    } catch (ex) {
      emit(LoginFailed(UnknownFailure(ex.toString())));
    }
  }

  void reset() => emit(LoginInitial());
}
