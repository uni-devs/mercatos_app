import 'package:formz/formz.dart';
import 'package:mercatos/components/utils/validations_errors/gender_validation_error.dart';

class Gender extends FormzInput<GenderType, GenderValidationError> {
  const Gender.pure() : super.pure(GenderType.male);
  const Gender.dirty([GenderType value = GenderType.male]) : super.dirty(value);

  @override
  GenderValidationError? validator(GenderType? value) {
    if (value == null) {
      return null;
    }
  }
}

enum GenderType { male, female }
