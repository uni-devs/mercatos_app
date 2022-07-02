import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../report_information_cubit/report_information_cubit.dart';
import '../set_password_cubit/set_password_cubit.dart';
import '../sport_information_cubit/sport_information_cubit.dart';
import '../user_type_cubit/user_type_cubit.dart';
import '../basic_information_cubit/basic_information_cubit.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final BasicInformationCubit basicInformationCubit;

  final SetPasswordCubit setPasswordCubit;

  final UserTypeCubit userTypeCubit;

  final SportInformationCubit sportInformationCubit;

  final ReportInformationCubit reportInformationCubit;

  RegistrationBloc({
    required this.basicInformationCubit,
    required this.setPasswordCubit,
    required this.userTypeCubit,
    required this.sportInformationCubit,
    required this.reportInformationCubit,
  }) : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) {});
  }
}
