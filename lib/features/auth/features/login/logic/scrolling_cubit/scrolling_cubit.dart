import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'scrolling_state.dart';

class ScrollingCubit extends Cubit<ScrollingState> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  ScrollingCubit() : super(ScrollingInitial());
}
