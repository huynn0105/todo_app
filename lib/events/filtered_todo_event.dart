import 'package:equatable/equatable.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/visibility_filter.dart';

abstract class FilteredTodoEvent extends Equatable {
  const FilteredTodoEvent();
}

class FilterUpdated extends FilteredTodoEvent {
  final VisibilityFilter filter;

  const FilterUpdated(this.filter);

  @override
  List<Object> get props => [filter];


}

class TodosUpdated extends FilteredTodoEvent {
  final List<Todo> todos;

  const TodosUpdated(this.todos);

  @override
  List<Object> get props => [todos];


}