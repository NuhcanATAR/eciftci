abstract class AuthPasswordState {}

class AuthPasswordInitial extends AuthPasswordState {}

class AuthPasswordSuccess extends AuthPasswordState {}

class AuthPasswordError extends AuthPasswordState {
  final String errorMessage;

  AuthPasswordError(this.errorMessage);
}
