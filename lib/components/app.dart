import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:todo_app/components/pages/todo_edit.dart';
import 'package:todo_app/components/pages/todo_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // initialize intl package
    Intl.defaultLocale = 'ja_JP';
    initializeDateFormatting('ja_JP');

    return MaterialApp(
      title: 'ToDo App',
      initialRoute: '/',
      routes: {
        '/': (context) => ToDoList(),
        'edit': (context) => ToDoEdit(),
      },
    );
  }
}
