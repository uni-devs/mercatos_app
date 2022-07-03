import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'report_information_state.dart';

class ReportInformationCubit extends Cubit<ReportInformationState> {
  ReportInformationCubit() : super(ReportInformationInitial());
}
