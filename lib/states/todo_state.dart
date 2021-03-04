import 'package:equatable/equatable.dart';
import 'package:todo_app/models/todo.dart';

abstract class TodoState extends Equatable{
  const TodoState();
  @override
  List<Object> get props => [];
}

class TodoLoadInProgress extends TodoState{

}

class TodoLoadSuccess extends TodoState{
  final List<Todo> todos;
  const TodoLoadSuccess({this.todos});
  @override
  List<Object> get props => [todos];
}

class TodoLoadFailure extends TodoState{}