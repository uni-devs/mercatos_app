part of 'sport_information_cubit.dart';

enum SportInformationType { football, basketball, volleyball }

abstract class SportInformationState extends Equatable {
  final SportInformationType type;
  final Position position;

  const SportInformationState({required this.type, required this.position});

  // ------------------------------------------------------------
  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'position': position.value.id,
    };
  }

  @override
  List<Object> get props => [type, position];
}

class InitialSportInformationState extends SportInformationState {
  const InitialSportInformationState()
      : super(
          type: SportInformationType.football,
          position: const Position.pure(),
        );
}

class FootballInformationState extends SportInformationState {
  const FootballInformationState(Position position)
      : super(
          type: SportInformationType.football,
          position: position,
        );
}

class BasketballInformationState extends SportInformationState {
  const BasketballInformationState(Position position)
      : super(
          type: SportInformationType.basketball,
          position: position,
        );
}

class VolleyballInformationState extends SportInformationState {
  const VolleyballInformationState(Position position)
      : super(
          type: SportInformationType.volleyball,
          position: position,
        );
}
