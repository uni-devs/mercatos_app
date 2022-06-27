import 'validation_error_interface.dart';

abstract class EmailValidationError extends ValidationError {}

class EmailInvalid extends EmailValidationError {}

class EmailEmpty extends EmailValidationError {}
