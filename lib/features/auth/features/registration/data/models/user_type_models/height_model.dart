import 'package:formz/formz.dart';
import 'package:mercatos/components/utils/validations_errors/height_validation_error.dart';

class Height extends FormzInput<HeightModel, HeightValidationError> {
  const Height.pure()
      : super.pure(
          HeightModel.empty,
        );
  const Height.dirty([HeightModel value = HeightModel.empty])
      : super.dirty(value);

  @override
  HeightValidationError? validator(HeightModel? value) {
    if (value == null) {
      return null;
    }
  }
}

enum HeightMeasuringUnit { cm, feet }

class HeightModel {
  final HeightMeasuringUnit unit;
  final double value;

  const HeightModel(this.value, this.unit);

  static const empty = HeightModel(0, HeightMeasuringUnit.cm);
}
