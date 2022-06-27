import 'validation_error_interface.dart';

abstract class PasswordValidationError extends ValidationError {}

class PasswordInvalid extends PasswordValidationError {}

class PasswordEmpty extends PasswordValidationError {}
