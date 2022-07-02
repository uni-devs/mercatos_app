import 'validation_error_interface.dart';

abstract class PhoneValidationError extends ValidationError {}

class PhoneInvalid extends PhoneValidationError {}

class PhoneEmpty extends PhoneValidationError {}
