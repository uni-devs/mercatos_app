import 'validation_error_interface.dart';

abstract class NameValidationError extends ValidationError {}

class NameInvalid extends NameValidationError {}

class NameEmpty extends NameValidationError {}
