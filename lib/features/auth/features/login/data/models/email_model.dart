import 'package:formz/formz.dart';

import '../../../../../../components/utils/regex.dart';
import '../../../../../../components/utils/validations_errors/email_validation_error.dart';

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('-');
  const Email.dirty([String value = '-']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    if (value == null) {
      return null;
    } else if (value.trim().isEmpty) {
      return EmailInvalid();
    } else if (!RegExValidation.email.hasMatch(value.trim())) {
      return EmailEmpty();
    } else {
      return null;
    }
  }
}
