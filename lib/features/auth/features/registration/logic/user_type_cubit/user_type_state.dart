part of 'user_type_cubit.dart';

enum UserType {
  normal,
  player,
  coach,
}

abstract class UserTypeState extends Equatable {
  final UserType userType;

  const UserTypeState({required this.userType});

  // ------------------------------------------------------------

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  List<Object> get props => [userType];
}

class NormalUserState extends UserTypeState {
  const NormalUserState() : super(userType: UserType.normal);

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': userType.name,
    };
  }
}

class PlayerUserState extends UserTypeState {
  final Gender gender;
  final Height height;
  final Weight weight;

  const PlayerUserState({
    required this.gender,
    required this.height,
    required this.weight,
  }) : super(userType: UserType.coach);

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': userType.name,
    };
  }
}

class CoachUserState extends UserTypeState {
  const CoachUserState() : super(userType: UserType.coach);

  @override
  Map<String, dynamic> toMap() {
    return {
      'type': userType.name,
    };
  }
}
