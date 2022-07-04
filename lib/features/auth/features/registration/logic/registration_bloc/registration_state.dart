part of 'registration_bloc.dart';

enum RegistrationStatus {
  initial,
  loading,
  success,
  error,
}

class RegistrationState extends Equatable {
  final RegistrationStatus status;

  const RegistrationState({
    required this.status,
  });

  // states
  static RegistrationState get initial => const RegistrationState(
        status: RegistrationStatus.initial,
      );
  // * temp state
  static RegistrationState get success => const RegistrationState(
        status: RegistrationStatus.success,
      );

  @override
  List<Object> get props => [];
}
