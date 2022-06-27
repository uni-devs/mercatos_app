import 'email_validation_error.dart';
import 'validation_error_interface.dart';

class ErrorMessages {
  String message(ValidationError error) {
    if (error is EmailInvalid) {
      return 'Email invalid';
    } else if (error is EmailEmpty) {
      return 'Email empty';
    } else {
      return 'Unknown error';
    }
  }
}
