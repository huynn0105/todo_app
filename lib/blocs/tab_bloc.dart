import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:todo_app/events/tab_event.dart';
import 'package:todo_app/models/visibility_filter.dart';

class TabBloc extends Bloc<TabEvent, VisibilityFilter> {
  TabBloc() : super(VisibilityFilter.all);

  @override
  Stream<VisibilityFilter> mapEventToState(TabEvent event) async* {
    if (event is TabUpdated) {
      yield event.tab;
    }
  }
}