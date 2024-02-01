abstract class AuthSignInState {}

class AuthSignInInitial extends AuthSignInState {}

class AuthSignInUserNotFound extends AuthSignInState {
  final String valueMessage;

  AuthSignInUserNotFound(this.valueMessage);
}

class AuthSignInWrongPasswordError extends AuthSignInState {
  final String valueMessage;

  AuthSignInWrongPasswordError(this.valueMessage);
}

class AuthSignInInvalidEmail extends AuthSignInState {
  final String valueMessage;

  AuthSignInInvalidEmail(this.valueMessage);
}

class AuthSignInTooManyRequest extends AuthSignInState {
  final String valueMessage;

  AuthSignInTooManyRequest(this.valueMessage);
}

class AuthSignInError extends AuthSignInState {
  final String valueMessage;

  AuthSignInError(this.valueMessage);
}

class AuthSignInSuccess extends AuthSignInState {}
