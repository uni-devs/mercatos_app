import 'package:formz/formz.dart';
import 'package:mercatos/components/utils/validations_errors/position_validation_error.dart';

class Position extends FormzInput<PlayerPosition, PositionValidationError> {
  const Position.pure() : super.pure(const InitialPlayerPosition());
  const Position.dirty([PlayerPosition value = const InitialPlayerPosition()])
      : super.dirty(value);

  @override
  PositionValidationError? validator(PlayerPosition? value) {
    if (value == null) {
      return null;
    }
  }
}

abstract class PlayerPosition {
  final String title;
  final String description;
  final String id;

  const PlayerPosition({
    required this.title,
    required this.description,
    required this.id,
  });
}

class InitialPlayerPosition extends PlayerPosition {
  const InitialPlayerPosition()
      : super(
          description: '',
          title: '',
          id: '',
        );
}
