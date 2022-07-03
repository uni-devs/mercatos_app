import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mercatos/features/auth/features/registration/data/models/sport_information_model/position_model.dart';

part 'sport_information_state.dart';

class SportInformationCubit extends Cubit<SportInformationState> {
  SportInformationCubit() : super(const InitialSportInformationState());
}
