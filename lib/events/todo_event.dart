import 'package:equatable/equatable.dart';
import 'package:todo_app/models/todo.dart';

abstract class TodoEvent extends Equatable{
  const TodoEvent();
  @override
  List<Object> get props => [];
}

class TodoLoadSuccesed extends TodoEvent{

}

class TodoUpdated extends TodoEvent{
  final Todo todo;

  const TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];

}

