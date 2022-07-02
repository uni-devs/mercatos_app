import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mercatos/features/auth/features/registration/data/models/models.dart';

part 'user_type_state.dart';

class UserTypeCubit extends Cubit<UserTypeState> {
  UserTypeCubit() : super(const NormalUserState());
}
