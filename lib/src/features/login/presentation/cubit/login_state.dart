part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoggingIn extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoggedIn extends LoginState {
  final User user;
  LoggedIn(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginFailed extends LoginState {
  final Failure failure;

  LoginFailed(this.failure);

  @override
  List<Object?> get props => [failure];
}
