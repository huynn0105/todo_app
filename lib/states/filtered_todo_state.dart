import 'package:equatable/equatable.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/visibility_filter.dart';

abstract class FilteredTodoState extends Equatable {
  const FilteredTodoState();

  @override
  List<Object> get props => [];
}

class FilteredTodosLoadInProgress extends FilteredTodoState {}

class FilteredTodoLoadSuccess extends FilteredTodoState {
  final List<Todo> filteredTodos;
  final VisibilityFilter filter;

  const FilteredTodoLoadSuccess(
    this.filteredTodos,
    this.filter,
  );

  @override
  List<Object> get props => [filteredTodos, filter];
}
