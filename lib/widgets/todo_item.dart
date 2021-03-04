import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {

  final ValueChanged<bool> onCheckboxChanged;
  final Todo todo;

  TodoItem({
    Key key,
    @required this.onCheckboxChanged,
    @required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.complete,
        onChanged: onCheckboxChanged,
      ),
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          todo.note,
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}