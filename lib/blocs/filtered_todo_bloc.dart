import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/events/filtered_todo_event.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/visibility_filter.dart';
import 'package:todo_app/states/filtered_todo_state.dart';
import 'package:todo_app/states/todo_state.dart';

class FilteredTodoBloc extends Bloc<FilteredTodoEvent, FilteredTodoState> {
  final TodoBloc todoBloc;
  StreamSubscription todoSubscription;

  FilteredTodoBloc({@required this.todoBloc})
      : super(
          todoBloc.state is TodoLoadSuccess
              ? FilteredTodoLoadSuccess(
                  (todoBloc.state as TodoLoadSuccess).todos,
                  VisibilityFilter.all,
                )
              : FilteredTodosLoadInProgress(),
        ) {
    todoSubscription = todoBloc.listen((state) {
      if (state is TodoLoadSuccess) {
        add(TodosUpdated((todoBloc.state as TodoLoadSuccess).todos));
      }
    });
  }

  @override
  Stream<FilteredTodoState> mapEventToState(FilteredTodoEvent event) async* {
    if (event is FilterUpdated) {
      if (todoBloc.state is TodoLoadSuccess) {
        yield FilteredTodoLoadSuccess(
          _mapTodoToFilteredTodo((todoBloc.state as TodoLoadSuccess).todos, event.filter,), event.filter,);
      }
    } else if (event is TodosUpdated) {
      final visibilityFilter = state is FilteredTodoLoadSuccess
          ? (state as FilteredTodoLoadSuccess).filter
          : VisibilityFilter.all;
      yield FilteredTodoLoadSuccess(
        _mapTodoToFilteredTodo(
          (todoBloc.state as TodoLoadSuccess).todos, visibilityFilter,),
        visibilityFilter,);
    }
  }




  List<Todo> _mapTodoToFilteredTodo(List<Todo> todos, VisibilityFilter filter) {
    return todos.where((todo) {
      if (filter == VisibilityFilter.all) {
        return true;
      }
      else if (filter == VisibilityFilter.incomplete) {
        return !todo.complete;
      }
      else {
        return todo.complete;
      }
    }).toList();
  }

  @override
  Future<void> close() {
    todoSubscription.cancel();
    return super.close();
  }
}
