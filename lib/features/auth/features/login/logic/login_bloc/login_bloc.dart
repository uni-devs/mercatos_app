import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../data/models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial) {
    on<LoginEmailChanged>(_onEmailChanged);

    on<LoginPasswordChanged>(_onPasswordChanged);

    on<LoginSubmitted>(_onLoginSubmitted);
  }

  _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);

    emit(
      state.emailChange(
        email,
        _formsStatusCopyWith(email: email),
      ),
    );
  }

  _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);

    emit(
      state.passwordChange(
        password,
        _formsStatusCopyWith(password: password),
      ),
    );
  }

  _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {}

  /// ------------------------------------------------------------
  FormzStatus _formsStatusCopyWith({
    Password? password,
    Email? email,
  }) {
    return Formz.validate([
      password ?? state.password,
      email ?? state.email,
    ]);
  }
}
