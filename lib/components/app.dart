import 'package:flutter/material.dart';
import 'package:todo_app/components/pages/todo_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      initialRoute: '/',
      routes: {
        '/': (context) => ToDoList(),
      },
    );
  }
}
