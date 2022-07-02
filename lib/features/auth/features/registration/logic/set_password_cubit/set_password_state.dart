part of 'set_password_cubit.dart';

enum BasicInformationStatus {
  initial,
  loading,
  error,
  success,
}

class SetPasswordState extends Equatable {
  final BasicInformationStatus status;

  final FormzStatus formzStatus;

  final Password password;

  const SetPasswordState({
    required this.status,
    required this.formzStatus,
    required this.password,
  });

  // states
  static SetPasswordState get initial => const SetPasswordState(
        formzStatus: FormzStatus.pure,
        status: BasicInformationStatus.initial,
        password: Password.pure(),
      );

  SetPasswordState _loading() {
    return _copyWith(status: BasicInformationStatus.loading);
  }

  SetPasswordState _error() {
    return _copyWith(status: BasicInformationStatus.error);
  }

  SetPasswordState _success() {
    return _copyWith(status: BasicInformationStatus.success);
  }

  // ------------------------------------------------------------

  // change password
  SetPasswordState passwordChange(Password password, FormzStatus formzStatus) {
    return _copyWith(password: password, formzStatus: formzStatus);
  }

  // ------------------------------------------------------------
  SetPasswordState _copyWith({
    BasicInformationStatus? status,
    FormzStatus? formzStatus,
    Password? password,
  }) {
    return SetPasswordState(
      status: status ?? this.status,
      formzStatus: formzStatus ?? this.formzStatus,
      password: password ?? this.password,
    );
  }

  // ------------------------------------------------------------

  Map<String, dynamic> toMap() {
    return {
      'password': password.value,
    };
  }

  // ------------------------------------------------------------
  @override
  List<Object> get props => [status, formzStatus, password];
}
