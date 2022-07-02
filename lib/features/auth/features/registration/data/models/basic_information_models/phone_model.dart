import 'package:formz/formz.dart';

import '../../../../../../../components/utils/validations_errors/phone_validation_error.dart';

class Phone extends FormzInput<String, PhoneValidationError> {
  const Phone.pure() : super.pure('-');
  const Phone.dirty([String value = '-']) : super.dirty(value);

  @override
  PhoneValidationError? validator(String? value) {
    if (value == null) {
      return null;
    } else if (value.trim().isEmpty) {
      return PhoneInvalid();
    } else if (value.trim().length < 3) {
      return PhoneEmpty();
    } else {
      return null;
    }
  }
}
