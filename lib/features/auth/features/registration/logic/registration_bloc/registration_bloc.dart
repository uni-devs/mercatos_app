import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mercatos/features/auth/features/registration/logic/set_password_cubit/set_password_cubit.dart';

import '../basic_information_cubit/basic_information_cubit.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final BasicInformationCubit basicInformationCubit;
  final SetPasswordCubit setPasswordCubit;

  RegistrationBloc({
    required this.basicInformationCubit,
    required this.setPasswordCubit,
  }) : super(RegistrationInitial()) {
    on<RegistrationEvent>((event, emit) {});
  }
}
