part of 'login_bloc.dart';

// presentations status

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState extends Equatable {
  final LoginStatus status;

  final FormzStatus formzStatus;

  final Email email;

  final Password password;

  const LoginState({
    required this.status,
    required this.email,
    required this.password,
    required this.formzStatus,
  });
  // ------------------------------------------------------------

  // states
  static LoginState get initial => const LoginState(
        email: Email.pure(),
        password: Password.pure(),
        formzStatus: FormzStatus.pure,
        status: LoginStatus.initial,
      );

  LoginState loading() {
    return _copyWith(status: LoginStatus.loading);
  }

  LoginState success() {
    return _copyWith(status: LoginStatus.success);
  }

  LoginState error() {
    return _copyWith(status: LoginStatus.error);
  }

  // ------------------------------------------------------------

  // change email
  LoginState emailChange(Email email, FormzStatus formzStatus) {
    return _copyWith(email: email, formzStatus: formzStatus);
  }

  // change password
  LoginState passwordChange(Password password, FormzStatus formzStatus) {
    return _copyWith(password: password, formzStatus: formzStatus);
  }

  // ------------------------------------------------------------
  LoginState _copyWith({
    LoginStatus? status,
    FormzStatus? formzStatus,
    Email? email,
    Password? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      formzStatus: formzStatus ?? this.formzStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, formzStatus, email, password];
}
