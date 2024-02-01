abstract class AuthSignUpState {}

class AuthSignUpInitial extends AuthSignUpState {}

class AuthSignUpError extends AuthSignUpState {
  final String errorMessage;

  AuthSignUpError(this.errorMessage);
}

class AuthSignUpEmailAlReadyInUse extends AuthSignUpState {
  final String errorMessage;

  AuthSignUpEmailAlReadyInUse(this.errorMessage);
}

class AuthSignUpSuccess extends AuthSignUpState {}
