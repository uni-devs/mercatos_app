part of 'basic_information_cubit.dart';

enum BasicInformationStatus {
  initial,
  loading,
  error,
  success,
}

class BasicInformationState extends Equatable {
  final BasicInformationStatus status;

  final FormzStatus formzStatus;

  final Email email;

  final Phone phone;

  final Name name;

  const BasicInformationState({
    required this.status,
    required this.formzStatus,
    required this.email,
    required this.phone,
    required this.name,
  });

  // states
  static BasicInformationState get initial => const BasicInformationState(
        email: Email.pure(),
        formzStatus: FormzStatus.pure,
        status: BasicInformationStatus.initial,
        name: Name.pure(),
        phone: Phone.pure(),
      );

  BasicInformationState _loading() {
    return _copyWith(status: BasicInformationStatus.loading);
  }

  BasicInformationState _error() {
    return _copyWith(status: BasicInformationStatus.error);
  }

  BasicInformationState _success() {
    return _copyWith(status: BasicInformationStatus.success);
  }

  // ------------------------------------------------------------

  // change email
  BasicInformationState emailChange(Email email, FormzStatus formzStatus) {
    return _copyWith(email: email, formzStatus: formzStatus);
  }

  // change name
  BasicInformationState nameChange(Name name, FormzStatus formzStatus) {
    return _copyWith(name: name, formzStatus: formzStatus);
  }

  // change phone
  BasicInformationState phoneChange(Phone phone, FormzStatus formzStatus) {
    return _copyWith(phone: phone, formzStatus: formzStatus);
  }

  // ------------------------------------------------------------
  BasicInformationState _copyWith({
    BasicInformationStatus? status,
    FormzStatus? formzStatus,
    Email? email,
    Name? name,
    Phone? phone,
  }) {
    return BasicInformationState(
      status: status ?? this.status,
      formzStatus: formzStatus ?? this.formzStatus,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  // ------------------------------------------------------------

  Map<String, dynamic> toMap() {
    return {
      'email': email.value,
      'phone': phone.value,
      'name': name.value,
    };
  }

  // ------------------------------------------------------------
  @override
  List<Object> get props => [status, formzStatus, email, phone, name];
}
