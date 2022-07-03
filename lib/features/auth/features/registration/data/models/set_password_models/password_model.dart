import 'package:formz/formz.dart';

import '../../../../../../../components/utils/validations_errors/password_validation_error.dart';

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null) {
      return null;
    } else if (value.trim().isEmpty) {
      return PasswordEmpty();
    } else {
      return null;
    }
  }
}
