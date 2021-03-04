import 'package:equatable/equatable.dart';
import 'package:todo_app/models/visibility_filter.dart';

abstract class TabEvent extends Equatable {
  const TabEvent();
}

class TabUpdated extends TabEvent {
  final VisibilityFilter tab;

  const TabUpdated(this.tab);

  @override
  List<Object> get props => [tab];


}