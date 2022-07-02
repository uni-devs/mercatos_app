import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../data/models/models.dart';

part 'set_password_state.dart';

class SetPasswordCubit extends Cubit<SetPasswordState> {
  SetPasswordCubit() : super(SetPasswordState.initial);

  // on email changed
  void passwordChange(String value) {
    final password = Password.dirty(value);

    emit(
      state.passwordChange(
        password,
        _formsStatusCopyWith(password: password),
      ),
    );
  }

  /// ------------------------------------------------------------
  FormzStatus _formsStatusCopyWith({
    Password? password,
  }) {
    return Formz.validate([
      password ?? state.password,
    ]);
  }
}
