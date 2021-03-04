import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/filtered_todo_bloc.dart';
import 'package:todo_app/blocs/tab_bloc.dart';
import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/events/filtered_todo_event.dart';
import 'package:todo_app/events/tab_event.dart';
import 'package:todo_app/events/todo_event.dart';
import 'package:todo_app/models/visibility_filter.dart';
import 'package:todo_app/states/filtered_todo_state.dart';
import 'package:todo_app/widgets/tab_selector.dart';
import 'package:todo_app/widgets/todo_item.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, VisibilityFilter>(
      builder: (context, activeTab) {
        BlocProvider.of<FilteredTodoBloc>(context).add(FilterUpdated(activeTab));
        return Scaffold(
          appBar: AppBar(
            title: Text("Todo App"),
          ),
          body: buildBody(context),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) =>
                BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
          ),
        );
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
      builder: (context, state) {
        if (state is FilteredTodosLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FilteredTodoLoadSuccess) {
          final todos = state.filteredTodos;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (BuildContext context, int index) {
              final todo = todos[index];
              return TodoItem(
                todo: todo,
                onCheckboxChanged: (_) {
                  BlocProvider.of<TodoBloc>(context).add(
                    TodoUpdated(todo.copyWith(complete: !todo.complete)),
                  );
                },
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}


