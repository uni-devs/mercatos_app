part of 'login_bloc.dart';

// events
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

abstract class FormzChanged extends LoginEvent {
  const FormzChanged();
}

abstract class Actions extends LoginEvent {
  const Actions();
}

// - - - - - - - - - - - - - - -

// FormzChanged events
class LoginEmailChanged extends FormzChanged {
  const LoginEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends FormzChanged {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

// Actions events
class LoginSubmitted extends Actions {
  const LoginSubmitted();
}
