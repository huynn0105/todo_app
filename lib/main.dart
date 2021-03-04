import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/events/todo_event.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'blocs/filtered_todo_bloc.dart';
import 'blocs/tab_bloc.dart';
import 'blocs/todo_bloc.dart';

void main() {
  runApp(
   BlocProvider(
     create: (context){
       return TodoBloc()..add(TodoLoadSuccesed());
     },
     child: MyApp(),
   )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabBloc>(
          create: (context) => TabBloc(),
        ),
        BlocProvider<FilteredTodoBloc>(
          create: (context) => FilteredTodoBloc(todoBloc: BlocProvider.of<TodoBloc>(context)),
        ),

      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );


  }
}





