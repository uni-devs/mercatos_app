import 'package:formz/formz.dart';

import '../../../../../../../components/utils/validations_errors/name_validation_error.dart';

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('-');
  const Name.dirty([String value = '-']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    if (value == null) {
      return null;
    } else if (value.trim().isEmpty) {
      return NameInvalid();
    } else if (value.trim().length < 3) {
      return NameEmpty();
    } else {
      return null;
    }
  }
}
