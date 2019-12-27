import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_app/blocs/todo_bloc.dart';
import 'package:todo_app/components/organisms/todo_list_view.dart';
import 'package:todo_app/models/todo.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ToDoBloc>(
      create: (_) => ToDoBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ToDo List'),
        ),
        body: ToDoListView(),
        floatingActionButton: _floatingButton(),
      ),
    );
  }

  Widget _floatingButton() {
    return Consumer<ToDoBloc>(
      builder: (context, bloc, __) {
        return FloatingActionButton(
          onPressed: () {
            bloc.addToDo(ToDo(
                id: 1,
                description: "test",
                createAt: DateTime.now(),
                completed: false));

            // for navigate edit screen
            // Navigator.pushNamed(context, 'edit');
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }
}
