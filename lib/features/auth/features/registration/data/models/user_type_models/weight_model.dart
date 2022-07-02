import 'package:formz/formz.dart';
import 'package:mercatos/components/utils/validations_errors/weight_validation_error.dart';

class Weight extends FormzInput<WeightModel, WeightValidationError> {
  const Weight.pure()
      : super.pure(
          WeightModel.empty,
        );
  const Weight.dirty([WeightModel value = WeightModel.empty])
      : super.dirty(value);

  @override
  WeightValidationError? validator(WeightModel? value) {
    if (value == null) {
      return null;
    }
  }
}

enum WeightMeasuringUnit { kg, pound }

class WeightModel {
  final WeightMeasuringUnit unit;
  final double value;

  const WeightModel(this.value, this.unit);

  static const empty = WeightModel(0, WeightMeasuringUnit.kg);
}
