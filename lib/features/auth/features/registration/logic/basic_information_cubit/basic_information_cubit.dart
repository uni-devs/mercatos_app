import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../data/models/models.dart';

part 'basic_information_state.dart';

class BasicInformationCubit extends Cubit<BasicInformationState> {
  BasicInformationCubit() : super(BasicInformationState.initial);

  // on email changed
  void emailChange(String value) {
    final email = Email.dirty(value);

    emit(
      state.emailChange(
        email,
        _formsStatusCopyWith(email: email),
      ),
    );
  }

  // on name changed
  void nameChange(String value) {
    final name = Name.dirty(value);

    emit(
      state.nameChange(
        name,
        _formsStatusCopyWith(name: name),
      ),
    );
  }

  // on phone changed
  void phoneChange(String value) {
    final phone = Phone.dirty(value);

    emit(
      state.phoneChange(
        phone,
        _formsStatusCopyWith(phone: phone),
      ),
    );
  }

  /// ------------------------------------------------------------
  FormzStatus _formsStatusCopyWith({
    Name? name,
    Email? email,
    Phone? phone,
  }) {
    return Formz.validate([
      name ?? state.name,
      email ?? state.email,
      phone ?? state.phone,
    ]);
  }
}
