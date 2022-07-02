part of 'report_information_cubit.dart';

abstract class ReportInformationState extends Equatable {
  const ReportInformationState();

  Map<String, dynamic> toMap() {
    return {};
  }

  @override
  List<Object> get props => [];
}

class ReportInformationInitial extends ReportInformationState {}
