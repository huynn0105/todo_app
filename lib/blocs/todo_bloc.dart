import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/events/todo_event.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/states/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent,TodoState>{
  TodoBloc() : super(TodoLoadInProgress());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
   if(event is TodoLoadSuccesed){
     yield TodoLoadSuccess(todos: datas);
   }

   else if(event is TodoUpdated){
     if (state is TodoLoadSuccess) {
       final List<Todo> updatedTodos = (state as TodoLoadSuccess).todos.map((todo) {
         return todo.id == event.todo.id ? event.todo : todo;
       }).toList();
       yield TodoLoadSuccess(todos: updatedTodos);

     }

   }
  }

}